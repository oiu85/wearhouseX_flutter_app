import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_color_extension.dart';

/// Home page app bar with search field and notification icon
class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onNotificationPressed;
  final int notificationCount;
  final String? hintText;

  const HomeAppBar({
    super.key,
    this.searchController,
    this.onSearchChanged,
    this.onNotificationPressed,
    this.notificationCount = 0,
    this.hintText,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  void initState() {
    super.initState();
    widget.searchController?.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.searchController?.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensionColors = theme.extension<AppColorExtension>()!;
    final hasText = widget.searchController?.text.isNotEmpty ?? false;

    return AppBar(
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              //* Search Field with modern design
              Expanded(
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: extensionColors.textFieldBorder.withAlpha(127),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: TextField(
                    controller: widget.searchController,
                    onChanged: widget.onSearchChanged,
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
                      hintText: widget.hintText ?? LocaleKeys.home_searchProducts.tr(),
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
                      suffixIcon: widget.searchController != null && hasText
                          ? IconButton(
                              icon: Icon(
                                Icons.clear_rounded,
                                color: extensionColors.hintText,
                                size: 20.sp,
                              ),
                              onPressed: () {
                                widget.searchController!.clear();
                                widget.onSearchChanged?.call('');
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(
                                minWidth: 40.w,
                                minHeight: 40.h,
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide.none,
                      ),
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
              ),
              SizedBox(width: 12.w),
              //* Notification Icon with Badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: extensionColors.textFieldBorder.withAlpha(127),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: theme.colorScheme.onSurface,
                        size: 24.sp,
                      ),
                      onPressed: widget.onNotificationPressed,
                      tooltip: LocaleKeys.menu_notifications.tr(),
                      padding: EdgeInsets.all(12.w),
                      constraints: BoxConstraints(
                        minWidth: 48.w,
                        minHeight: 48.h,
                      ),
                    ),
                  ),
                  if (widget.notificationCount > 0)
                    Positioned(
                      right: 8.w,
                      top: 8.h,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.scaffoldBackgroundColor,
                            width: 2,
                          ),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 18.w,
                          minHeight: 18.h,
                        ),
                        child: Center(
                          child: Text(
                            widget.notificationCount > 9
                                ? '9+'
                                : '${widget.notificationCount}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onError,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
