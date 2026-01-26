import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../core/network/network_client.dart';
import '../../features/notifications/data/datasources/notifications_local_datasource.dart';
import '../../features/notifications/domain/entities/notification_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Handling background message: ${message.messageId}');
  
  // Save notification to local storage
  try {
    final prefs = await SharedPreferences.getInstance();
    final dataSource = NotificationsLocalDataSource(prefs);
    
    final notification = NotificationEntity(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification?.title ?? 'Notification',
      body: message.notification?.body ?? '',
      data: message.data,
      receivedAt: message.sentTime ?? DateTime.now(),
      isRead: false,
    );
    
    await dataSource.saveNotification(notification);
  } catch (e) {
    debugPrint('Failed to save background notification: $e');
  }
}

/// Service for handling Firebase Cloud Messaging (FCM)
class FcmService {
  FirebaseMessaging? _messaging;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final NetworkClient _networkClient = GetIt.instance<NetworkClient>();
  late NotificationsLocalDataSource _notificationsDataSource;

  String? _fcmToken;
  bool _initialized = false;

  /// Get FirebaseMessaging instance (lazy initialization)
  FirebaseMessaging get _messagingInstance {
    _messaging ??= FirebaseMessaging.instance;
    return _messaging!;
  }

  /// Initialize FCM service
  Future<void> initialize() async {
    if (_initialized) return;

    try {
      // Initialize notifications data source
      final prefs = GetIt.instance<SharedPreferences>();
      _notificationsDataSource = NotificationsLocalDataSource(prefs);

      // Request notification permissions
      await _requestPermissions();

      // Initialize local notifications
      await _initializeLocalNotifications();

      // Set up message handlers
      _setupMessageHandlers();

      // Get and register FCM token
      await getToken();

      _initialized = true;
      debugPrint('FCM Service initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize FCM Service: $e');
    }
  }

  /// Request notification permissions
  Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      final settings = await _messagingInstance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted notification permission');
      } else {
        debugPrint('User declined notification permission');
      }
    } else if (Platform.isAndroid) {
      // Android 13+ requires runtime permission
      final androidInfo = await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidInfo != null) {
        await androidInfo.requestNotificationsPermission();
      }
    }
  }

  /// Initialize local notifications for foreground messages
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channel for Android
    if (Platform.isAndroid) {
      const androidChannel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notifications',
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
      );

      final androidImplementation = _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      if (androidImplementation != null) {
        await androidImplementation.createNotificationChannel(androidChannel);
      }
    }
  }

  /// Set up message handlers
  void _setupMessageHandlers() {
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle background messages (when app is terminated)
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Handle notification taps
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Check if app was opened from a notification
    _checkInitialMessage();
  }

  /// Handle foreground messages
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    debugPrint('Received foreground message: ${message.messageId}');
    debugPrint('Message title: ${message.notification?.title}');
    debugPrint('Message body: ${message.notification?.body}');
    debugPrint('Message data: ${message.data}');

    try {
      // Save notification to local storage
      await _saveNotification(message);

      // Show local notification
      await _showLocalNotification(message);
      
      debugPrint('Foreground message handled successfully');
    } catch (e) {
      debugPrint('Error handling foreground message: $e');
    }
  }

  /// Save notification to local storage
  Future<void> _saveNotification(RemoteMessage message) async {
    try {
      final notification = NotificationEntity(
        id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification?.title ?? 'Notification',
        body: message.notification?.body ?? '',
        data: message.data,
        receivedAt: message.sentTime ?? DateTime.now(),
        isRead: false,
      );

      await _notificationsDataSource.saveNotification(notification);
    } catch (e) {
      debugPrint('Failed to save notification: $e');
    }
  }

  /// Show local notification
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;

    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      details,
      payload: message.data.toString(),
    );
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    debugPrint('Notification tapped: ${response.payload}');
    // Handle navigation based on notification data
    // This will be handled by the app router
  }

  /// Handle notification tap when app is in background
  void _handleNotificationTap(RemoteMessage message) {
    debugPrint('Notification tapped: ${message.messageId}');
    // Handle navigation based on notification data
    // This will be handled by the app router
  }

  /// Check if app was opened from a notification
  Future<void> _checkInitialMessage() async {
    final initialMessage = await _messagingInstance.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  /// Get FCM token
  Future<String?> getToken() async {
    try {
      _fcmToken = await _messagingInstance.getToken();
      debugPrint('FCM Token: $_fcmToken');

      // Register token with backend if user is logged in (non-blocking)
      // Don't await - let it happen in the background
      _registerTokenWithBackend().catchError((error) {
        debugPrint('Background FCM token registration failed: $error');
      });

      // Listen for token refresh
      _messagingInstance.onTokenRefresh.listen((newToken) {
        _fcmToken = newToken;
        _registerTokenWithBackend().catchError((error) {
          debugPrint('Background FCM token refresh registration failed: $error');
        });
      });

      return _fcmToken;
    } catch (e) {
      debugPrint('Failed to get FCM token: $e');
      return null;
    }
  }

  /// Register FCM token with backend (non-blocking with timeout)
  Future<void> _registerTokenWithBackend() async {
    if (_fcmToken == null) {
      debugPrint('FCM token is null, cannot register with backend');
      return;
    }

    try {
      final platform = Platform.isAndroid
          ? 'android'
          : Platform.isIOS
              ? 'ios'
              : 'web';

      debugPrint('Registering FCM token with backend: ${_fcmToken!.substring(0, 20)}... (platform: $platform)');

      final result = await _networkClient.post(
        '/fcm-token',
        data: {
          'token': _fcmToken,
          'platform': platform,
          'device_id': await _getDeviceId(),
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      result.fold(
        (failure) {
          debugPrint('Failed to register FCM token: ${failure.message}');
          // Retry after 5 seconds
          Future.delayed(const Duration(seconds: 5), () {
            debugPrint('Retrying FCM token registration...');
            _registerTokenWithBackend();
          });
        },
        (response) {
          debugPrint('FCM token registered successfully with backend');
        },
      );
    } on TimeoutException {
      debugPrint('FCM token registration timeout - will retry later');
      // Retry after 5 seconds
      Future.delayed(const Duration(seconds: 5), () {
        debugPrint('Retrying FCM token registration after timeout...');
        _registerTokenWithBackend();
      });
    } catch (e) {
      debugPrint('Failed to register FCM token with backend: $e');
      // Retry after 5 seconds
      Future.delayed(const Duration(seconds: 5), () {
        debugPrint('Retrying FCM token registration after error...');
        _registerTokenWithBackend();
      });
    }
  }

  /// Get device ID (using SharedPreferences directly)
  Future<String?> _getDeviceId() async {
    try {
      final prefs = GetIt.instance<SharedPreferences>();
      String? deviceId = prefs.getString('device_id');
      if (deviceId == null || deviceId.isEmpty) {
        deviceId = DateTime.now().millisecondsSinceEpoch.toString();
        await prefs.setString('device_id', deviceId);
      }
      return deviceId;
    } catch (e) {
      debugPrint('Failed to get device ID: $e');
      return DateTime.now().millisecondsSinceEpoch.toString();
    }
  }

  /// Unregister FCM token (on logout)
  Future<void> unregisterToken() async {
    if (_fcmToken == null) return;

    try {
      final result = await _networkClient.delete(
        '/fcm-token',
        data: {'token': _fcmToken},
      );

      result.fold(
        (failure) => debugPrint('Failed to unregister FCM token: ${failure.message}'),
        (response) {
          _fcmToken = null;
          debugPrint('FCM token unregistered');
        },
      );
    } catch (e) {
      debugPrint('Failed to unregister FCM token: $e');
    }
  }
}
