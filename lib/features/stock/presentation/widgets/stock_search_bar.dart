import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';

//* Search bar widget
class StockSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const StockSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: CustomTextField(
        controller: controller,
        hintText: 'home.searchProducts'.tr(),
        prefixIcon: Icon(
          Icons.search,
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
