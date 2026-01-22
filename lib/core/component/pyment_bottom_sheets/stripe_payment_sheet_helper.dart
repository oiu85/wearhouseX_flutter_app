import '../../shared/app_snackbar.dart';
import '../../localization/locale_keys.g.dart';
import '../../shared/app_navigator_key.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

/// Helper class for presenting Stripe payment sheets
/// This handles the common logic for initializing and presenting payment sheets
class StripePaymentSheetHelper {
  /// Present Stripe Payment Sheet using the global navigator context
  /// This is called AFTER the bottom sheet is closed to avoid Activity Result issues
  /// 
  /// [onSuccess] callback is called when payment is successfully completed
  /// [onCancelled] callback is called when user cancels the payment
  /// [onError] callback is called when payment fails with error message
  static Future<void> presentPaymentSheet(
    String clientSecret, {
    String? debugLabel,
    VoidCallback? onSuccess,
    VoidCallback? onCancelled,
    void Function(String)? onError,
  }) async {
    try {
      debugPrint('🔄 Initializing Stripe Payment Sheet${debugLabel != null ? ' for $debugLabel' : ''}...');
      
      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Charity Project',
          style: ThemeMode.system,
        ),
      );
      
      debugPrint('✅ Payment Sheet initialized, presenting...');

      // Present payment sheet - this handles the full payment flow
      // When this completes without throwing, the payment is confirmed on Stripe's side
      await Stripe.instance.presentPaymentSheet();
      
      debugPrint('✅ Payment Sheet completed successfully!');
      debugPrint('💳 Payment has been confirmed with Stripe');
      debugPrint('📋 Note: Backend should receive webhook to update status');
      
      // Show success message using global context
      _showSuccessMessage();
      
      // Call success callback if provided
      if (onSuccess != null) {
        onSuccess();
      }
    } on StripeException catch (e) {
      final errorCode = e.error.code;
      final errorMessage = e.error.message ?? 'Payment failed';
      
      debugPrint('❌ Stripe Error: $errorCode - $errorMessage');
      
      // Don't show error if user just cancelled
      if (errorCode == FailureCode.Canceled) {
        debugPrint('ℹ️ User cancelled payment');
        // Call cancelled callback if provided
        if (onCancelled != null) {
          onCancelled();
        }
        return;
      }
      
      // Show error message using global context
      _showErrorMessage(errorMessage);
      
      // Call error callback if provided
      if (onError != null) {
        onError(errorMessage);
      }
    } catch (e) {
      debugPrint('❌ Payment Error: $e');
      _showErrorMessage(e.toString());
      
      // Call error callback if provided
      if (onError != null) {
        onError(e.toString());
      }
    }
  }

  static void _showSuccessMessage() {
    final globalContext = appNavigatorKey.currentContext;
    if (globalContext != null) {
      AppSnackbar.showSuccess(
        globalContext,
        LocaleKeys.fastDonate_donationSuccess,
      );
    }
  }

  static void _showErrorMessage(String message) {
    final globalContext = appNavigatorKey.currentContext;
    if (globalContext != null) {
      AppSnackbar.showError(
        globalContext,
        message,
        translation: false,
      );
    }
  }
}

