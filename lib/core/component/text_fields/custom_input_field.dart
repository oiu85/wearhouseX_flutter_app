import '../../theme/app_color_extension.dart';
import '../../localization/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable input field with label, prefix (currency/unit), and optional divider
class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final String? prefix; // e.g., "$", "g"
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool showDivider;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    this.prefix,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(label, textAlign: TextAlign.right, style: theme.textTheme.labelLarge?.copyWith(color: extensionColors.black.withValues(alpha: 0.80), fontSize: 14.sp, fontWeight: FontWeight.w700, height: 1.40)),
        SizedBox(height: 12.h),
        Container(
          height: 48.h,
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: extensionColors.shadow.withValues(alpha: 0.40)), borderRadius: BorderRadius.circular(12.r))),
          child: Row(
            children: [
              if (prefix != null) ...[
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: AppText(prefix!, translation: false, textAlign: TextAlign.center, style: theme.textTheme.headlineSmall?.copyWith(color: extensionColors.hintText, fontSize: 20.sp, fontWeight: FontWeight.w700, height: 1.35))),
                if (showDivider) Container(width: 1.w, height: 46.h, decoration: ShapeDecoration(shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: extensionColors.divider.withValues(alpha: 0.80))))),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.right,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  style: theme.textTheme.bodyMedium?.copyWith(color: extensionColors.black, fontSize: 12.sp, fontWeight: FontWeight.w400, height: 1.40),
                  decoration: InputDecoration(hintText: hint.tr(), hintStyle: theme.textTheme.bodyMedium?.copyWith(color: extensionColors.inactiveIndicator, fontSize: 12.sp, fontWeight: FontWeight.w400, height: 1.40), border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


