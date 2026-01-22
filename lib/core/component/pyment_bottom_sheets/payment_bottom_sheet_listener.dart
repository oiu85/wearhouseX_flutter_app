// import 'package:charity_project_flutter/features/payment/presentation/bloc/payment_bloc.dart';
// import 'package:charity_project_flutter/features/payment/presentation/bloc/payment_state.dart';
// import '../../localization/app_text.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// /// Reusable BlocListener for payment bottom sheets
// /// Handles navigation (closing bottom sheet) when payment sheet should be presented
// /// Payment sheet presentation is now handled automatically in PaymentBloc
// class PaymentBottomSheetListener extends StatelessWidget {
//   final Widget child;
//   final String? debugLabel;
//   final VoidCallback? onError;
//   final VoidCallback? onSubscriptionSuccess;
//
//   const PaymentBottomSheetListener({
//     super.key,
//     required this.child,
//     this.debugLabel,
//     this.onError,
//     this.onSubscriptionSuccess,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<PaymentBloc, PaymentState>(
//       listener: (context, state) {
//         // When payment sheet should be presented, close bottom sheet first
//         // The bloc will handle presenting the payment sheet after a delay
//         if (state.shouldPresentPaymentSheet && state.donationResponse != null) {
//           debugPrint('📋 Closing bottom sheet${debugLabel != null ? ' for $debugLabel' : ''} before presenting payment sheet...');
//           Navigator.of(context).pop();
//         }
//
//         // Handle subscription success
//         if (state.subscriptionResponse != null &&
//             state.status.isSuccess() &&
//             !state.isPaymentProcessing) {
//           if (onSubscriptionSuccess != null) {
//             onSubscriptionSuccess!();
//           }
//         }
//
//         // Handle errors
//         if (state.status.isFail() && state.errorMessage != null) {
//           if (onError != null) {
//             onError!();
//           } else {
//             _showErrorMessage(context, state.errorMessage!);
//           }
//         }
//       },
//       child: child,
//     );
//   }
//
//   void _showErrorMessage(BuildContext context, String message) {
//     final theme = Theme.of(context);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: AppText(
//           message,
//           translation: false,
//           style: TextStyle(color: theme.colorScheme.onError),
//         ),
//         backgroundColor: theme.colorScheme.error,
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }
// }
//
