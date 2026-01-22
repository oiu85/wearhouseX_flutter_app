// import '../custom_back_button_outlined.dart';
// import '../drag_handle.dart';
// import 'payment_bottom_sheet_listener.dart';
// import 'package:charity_project_flutter/features/payment/presentation/bloc/payment_bloc.dart';
// import 'package:charity_project_flutter/features/payment/presentation/bloc/payment_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// /// Base widget for payment bottom sheets
// /// Provides common structure: loading overlay, back button, drag handle, and payment listener
// class PaymentBottomSheetBase extends StatelessWidget {
//   final PaymentBloc paymentBloc;
//   final Widget Function(BuildContext context, bool isLoading) childBuilder;
//   final String? debugLabel;
//   final VoidCallback? onBack;
//   final VoidCallback? onError;
//   final VoidCallback? onSubscriptionSuccess;
//   final bool showBackButton;
//
//   const PaymentBottomSheetBase({
//     super.key,
//     required this.paymentBloc,
//     required this.childBuilder,
//     this.debugLabel,
//     this.onBack,
//     this.onError,
//     this.onSubscriptionSuccess,
//     this.showBackButton = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return BlocProvider.value(
//       value: paymentBloc,
//       child: PaymentBottomSheetListener(
//         debugLabel: debugLabel,
//         onError: onError,
//         onSubscriptionSuccess: onSubscriptionSuccess,
//         child: BlocBuilder<PaymentBloc, PaymentState>(
//           builder: (context, state) {
//             final isLoading =
//                 state.status.isLoading() || state.isPaymentProcessing;
//
//             return Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.surface,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30.r),
//                     topRight: Radius.circular(30.r),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     SingleChildScrollView(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(height: 16.h),
//                             Row(
//                               children: [
//                                 if (showBackButton) ...[
//                                   SizedBox(width: 8.w),
//                                   CustomBackButton(
//                                     onTap: onBack ?? () => Navigator.pop(context),
//                                   ),
//                                 ],
//                                 const Spacer(),
//                                 const Center(child: DragHandle()),
//                                 const Spacer(),
//                               ],
//                             ),
//                             SizedBox(height: 24.h),
//                             childBuilder(context, isLoading),
//                             SizedBox(height: 32.h),
//                           ],
//                         ),
//                       ),
//                     ),
//                     if (isLoading)
//                       Positioned.fill(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.3),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30.r),
//                               topRight: Radius.circular(30.r),
//                             ),
//                           ),
//                           child: const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
