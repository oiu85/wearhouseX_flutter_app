import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../gen/assets.gen.dart';

//* Custom app bar with pull-to-refresh support
class StockAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RefreshController refreshController;
  final VoidCallback onRefresh;
  final VoidCallback onSortPressed;

  const StockAppBar({
    super.key,
    required this.refreshController,
    required this.onRefresh,
    required this.onSortPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(9999993.r),
        child: Image.asset(
          Assets.images.png.logoWerahouse.path,
          width: 50.w,
          height: 50.h,
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      actions: [
        //* Sort button
        IconButton(
          icon: Icon(Icons.sort, color: theme.colorScheme.onSurface),
          onPressed: onSortPressed,
          tooltip: 'home.sortBy'.tr(),
        ),
        //* Refresh button (alternative to pull-to-refresh)
        IconButton(
          icon: Icon(Icons.refresh, color: theme.colorScheme.onSurface),
          onPressed: () {
            if (!refreshController.isRefresh) {
              refreshController.requestRefresh();
              onRefresh();
            }
          },
          tooltip: 'app.refresh'.tr(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
