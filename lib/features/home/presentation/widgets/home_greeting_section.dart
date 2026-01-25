import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/app_text.dart';

/// Greeting section widget with modern typography
class HomeGreetingSection extends StatelessWidget {
  final String? greetingText;

  const HomeGreetingSection({
    super.key,
    this.greetingText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (greetingText == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 20.h),
      child: AppText(
        greetingText!,
        translation: false,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
          fontSize: 24.sp,
          height: 1.3,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
