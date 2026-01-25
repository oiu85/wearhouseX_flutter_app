import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';
import 'package:permission_handler/permission_handler.dart';

/// Service for handling PDF operations
class PdfService {
  static const MethodChannel _channel = MethodChannel('com.example.flutter_app_wearhouse/pdf_service');
  /// Save PDF bytes to Downloads directory using MediaStore (Android) or Documents (iOS)
  Future<String?> savePdf({
    required List<int> bytes,
    required String fileName,
  }) async {
    try {
      if (Platform.isAndroid) {
        return await _savePdfAndroid(bytes, fileName);
      } else if (Platform.isIOS) {
        return await _savePdfIOS(bytes, fileName);
      } else {
        // For other platforms, use documents directory
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(bytes);
        return filePath;
      }
    } catch (e) {
      debugPrint('Error saving PDF: $e');
      return null;
    }
  }

  /// Save PDF to Downloads directory on Android using MediaStore
  Future<String?> _savePdfAndroid(
    List<int> bytes,
    String fileName,
  ) async {
    try {
      if (Platform.isAndroid) {
        // Use MediaStore via platform channel for Android 10+
        try {
          final result = await _channel.invokeMethod<String>(
            'savePdfToDownloads',
            {
              'fileName': fileName,
              'bytes': bytes,
            },
          );
          return result;
        } on PlatformException catch (e) {
          debugPrint('Platform channel error: ${e.message}');
          // Fallback to direct file system access if platform channel fails
          return await _savePdfAndroidFallback(bytes, fileName);
        }
      }
      return null;
    } catch (e) {
      debugPrint('Error saving PDF on Android: $e');
      return null;
    }
  }

  /// Fallback method for saving PDF when MediaStore platform channel is not available
  Future<String?> _savePdfAndroidFallback(
    List<int> bytes,
    String fileName,
  ) async {
    try {
      // Request storage permission for Android 12 and below
      if (await _shouldRequestStoragePermission()) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          debugPrint('Storage permission denied');
          return null;
        }
      }

      // Get Downloads directory
      final directory = await _getDownloadsDirectory();
      if (directory == null) {
        debugPrint('Could not get Downloads directory');
        return null;
      }

      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      
      // Create directory if it doesn't exist
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      await file.writeAsBytes(bytes);
      return filePath;
    } catch (e) {
      debugPrint('Error in fallback save: $e');
      return null;
    }
  }

  /// Save PDF to Documents directory on iOS
  Future<String?> _savePdfIOS(
    List<int> bytes,
    String fileName,
  ) async {
    try {
      // On iOS, save to Documents directory which is accessible via Files app
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      return filePath;
    } catch (e) {
      debugPrint('Error saving PDF on iOS: $e');
      return null;
    }
  }

  /// Get Downloads directory path
  Future<Directory?> _getDownloadsDirectory() async {
    try {
      if (Platform.isAndroid) {
        // Try to get external storage directory
        final externalDir = await getExternalStorageDirectory();
        if (externalDir != null) {
          // Navigate to Downloads folder
          // Path structure: /storage/emulated/0/Download
          final downloadsPath = externalDir.path
              .replaceAll('/Android/data/${_getPackageName()}/files', '')
              .replaceAll('/data/data/${_getPackageName()}/files', '');
          
          // Try common Downloads paths
          final possiblePaths = [
            '$downloadsPath/Download',
            '/storage/emulated/0/Download',
            '/sdcard/Download',
          ];

          for (final path in possiblePaths) {
            final dir = Directory(path);
            if (await dir.exists() || await _canCreateDirectory(path)) {
              return dir;
            }
          }

          // If none exist, try to create in external storage
          final downloadsDir = Directory('${externalDir.parent.path}/Download');
          return downloadsDir;
        }
      }
      return null;
    } catch (e) {
      debugPrint('Error getting Downloads directory: $e');
      return null;
    }
  }

  /// Check if we should request storage permission
  Future<bool> _shouldRequestStoragePermission() async {
    if (!Platform.isAndroid) return false;
    
    // Android 13+ (API 33+) doesn't need storage permission for MediaStore
    // But we still need it for older versions
    return true;
  }

  /// Check if directory can be created
  Future<bool> _canCreateDirectory(String path) async {
    try {
      final dir = Directory(path);
      await dir.create(recursive: true);
      return await dir.exists();
    } catch (e) {
      return false;
    }
  }

  /// Get package name for Android
  String _getPackageName() {
    // This would typically come from package_info_plus
    // For now, return a placeholder - in production, use package_info_plus
    return 'com.example.flutter_app_wearhouse';
  }

  /// Share PDF file
  Future<bool> sharePdf({
    required String filePath,
    String? subject,
    String? text,
  }) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return false;
      }

      final xFile = XFile(filePath);
      await Share.shareXFiles(
        [xFile],
        subject: subject,
        text: text,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Save PDF to cache directory (no permissions required)
  /// Used for sharing files without requiring storage permissions
  Future<String?> _savePdfToCache({
    required List<int> bytes,
    required String fileName,
  }) async {
    try {
      // Use cache directory which doesn't require permissions
      final cacheDir = await getTemporaryDirectory();
      final filePath = '${cacheDir.path}/$fileName';
      final file = File(filePath);
      
      // Write bytes to cache file
      await file.writeAsBytes(bytes);
      
      return filePath;
    } catch (e) {
      debugPrint('Error saving PDF to cache: $e');
      return null;
    }
  }

  /// Download and share PDF from bytes
  /// Uses cache directory to avoid permission issues
  Future<bool> downloadAndSharePdf({
    required List<int> bytes,
    required String fileName,
    String? subject,
    String? text,
  }) async {
    try {
      // Save to cache directory instead of Downloads (no permissions needed)
      final filePath = await _savePdfToCache(
        bytes: bytes,
        fileName: fileName,
      );

      if (filePath == null) {
        debugPrint('Failed to save PDF to cache for sharing');
        return false;
      }

      // Share from cache directory
      final success = await sharePdf(
        filePath: filePath,
        subject: subject,
        text: text,
      );

      // Optionally clean up the cache file after sharing
      // Note: We don't delete immediately as the share might still be processing
      // The OS will clean up temporary files automatically

      return success;
    } catch (e) {
      debugPrint('Error in downloadAndSharePdf: $e');
      return false;
    }
  }
}
