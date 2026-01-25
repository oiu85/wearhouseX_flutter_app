import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//* Greeting section widget
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
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: Text(
        greetingText!,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
