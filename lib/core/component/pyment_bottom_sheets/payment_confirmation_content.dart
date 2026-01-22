// import '../custom_filled_button.dart';
// import 'anonymous_donation_toggle.dart';
// import '../../localization/app_text.dart';
// import '../../localization/locale_keys.g.dart';
// import '../../theme/app_color_extension.dart';
// import 'package:charity_project_flutter/features/campaign/presentation/widgets/bottom_sheet/unspecified_donation/confirmation_widgets/total_amount_row.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// /// Reusable payment confirmation content widget
// /// Displays title, amount display (optional), anonymous toggle, total amount, and confirm button
// class PaymentConfirmationContent extends StatelessWidget {
//   final String title;
//   final Widget? amountDisplay;
//   final String amount;
//   final String currency;
//   final bool isAnonymous;
//   final ValueChanged<bool> onAnonymousChanged;
//   final VoidCallback onConfirm;
//   final bool isLoading;
//   final String confirmButtonText;
//
//   const PaymentConfirmationContent({
//     super.key,
//     required this.title,
//     this.amountDisplay,
//     required this.amount,
//     required this.currency,
//     required this.isAnonymous,
//     required this.onAnonymousChanged,
//     required this.onConfirm,
//     this.isLoading = false,
//     this.confirmButtonText = LocaleKeys.fastDonate_confirmAndGoToPaid,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final extensionColors = theme.extension<AppColorExtension>()!;
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         AppText(
//           title,
//           style: theme.textTheme.titleLarge?.copyWith(
//             color: extensionColors.campaignTitleColor,
//             fontSize: 24.sp,
//             fontWeight: FontWeight.w700,
//             height: 1.35,
//           ),
//         ),
//         SizedBox(height: 32.h),
//         if (amountDisplay != null) ...[
//           amountDisplay!,
//           SizedBox(height: 24.h),
//         ],
//         AnonymousDonationToggle(
//           value: isAnonymous,
//           onChanged: onAnonymousChanged,
//         ),
//         SizedBox(height: 16.h),
//         TotalAmountRow(
//           amount: amount,
//           currency: currency,
//         ),
//         SizedBox(height: 24.h),
//         CustomFilledButton(
//           text: confirmButtonText,
//           onPressed: isLoading ? null : onConfirm,
//           height: 44.h,
//           fontSize: 16.sp,
//           icon: Icons.arrow_forward,
//           iconColor: theme.colorScheme.surface,
//         ),
//       ],
//     );
//   }
// }
//
