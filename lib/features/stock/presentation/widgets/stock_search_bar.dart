import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_color_extension.dart';
import 'package:easy_localization/easy_localization.dart';

/// Search bar widget with modern design
class StockSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const StockSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<StockSearchBar> createState() => _StockSearchBarState();
}

class _StockSearchBarState extends State<StockSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;
    final hasText = widget.controller.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: extensionColors.textFieldBorder.withAlpha(127),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          textAlignVertical: TextAlignVertical.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            hintText: LocaleKeys.home_searchProducts.tr(),
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: extensionColors.hintText,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Icon(
                Icons.search_rounded,
                color: extensionColors.hintText,
                size: 22.sp,
              ),
            ),
            suffixIcon: hasText
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: extensionColors.hintText,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onChanged('');
                    },
                  )
                : null,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
