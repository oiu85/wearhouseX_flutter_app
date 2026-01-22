import '../../localization/app_text.dart';
import '../../localization/locale_keys.g.dart';
import 'package:flutter/material.dart';

/// Reusable anonymous donation toggle widget
class AnonymousDonationToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AnonymousDonationToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return CheckboxListTile(
      title: AppText(
        LocaleKeys.fastDonate_makeAnonymous,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      value: value,
      onChanged: (newValue) => onChanged(newValue ?? false),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}

