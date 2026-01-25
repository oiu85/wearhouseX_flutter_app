import '../../localization/app_text.dart';
import '../../localization/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Depend on locale to rebuild labels when language changes
    final _ = context.locale;
    final theme = Theme.of(context);

    return StylishBottomBar(
      option: AnimatedBarOptions(
        iconSize: 24.sp,
        barAnimation: BarAnimation.blink,
        iconStyle: IconStyle.Default,
        opacity: 1,
      ),
      items: [
        //* Home Item (Dashboard)
        BottomBarItem(
          icon: Icon(
            Icons.home,
            size: 24.sp,
            color: theme.colorScheme.onSurface,
          ),
          selectedIcon: Icon(
            Icons.home,
            size: 24.sp,
            color: theme.colorScheme.secondary,
          ),
          title: AppText(
            isAutoScale: true,
            LocaleKeys.bottomNav_home,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          selectedColor: theme.colorScheme.secondary,
          unSelectedColor: theme.colorScheme.onSurface,
        ),
        
        //* Stock Item
        BottomBarItem(
          icon: Icon(
            Icons.inventory_2,
            size: 24.sp,
            color: theme.colorScheme.onSurface,
          ),
          selectedIcon: Icon(
            Icons.inventory_2,
            size: 24.sp,
            color: theme.colorScheme.secondary,
          ),
          title: AppText(
            isAutoScale: true,
            LocaleKeys.bottomNav_stock,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          selectedColor: theme.colorScheme.secondary,
          unSelectedColor: theme.colorScheme.onSurface,
        ),
        
        //* Cart Item
        BottomBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 24.sp,
            color: theme.colorScheme.onSurface,
          ),
          selectedIcon: Icon(
            Icons.shopping_cart,
            size: 24.sp,
            color: theme.colorScheme.secondary,
          ),
          title: AppText(
            isAutoScale: true,
            LocaleKeys.sales_cart,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          selectedColor: theme.colorScheme.secondary,
          unSelectedColor: theme.colorScheme.onSurface,
        ),
        
        //* Menu Item
        BottomBarItem(
          icon: Icon(
            Icons.menu,
            size: 24.sp,
            color: theme.colorScheme.onSurface,
          ),
          selectedIcon: Icon(
            Icons.menu,
            size: 24.sp,
            color: theme.colorScheme.secondary,
          ),
          title: AppText(
            isAutoScale: true,
            LocaleKeys.bottomNav_menu,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          selectedColor: theme.colorScheme.secondary,
          unSelectedColor: theme.colorScheme.onSurface,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      hasNotch: false,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.r),
      ),
      backgroundColor: theme.colorScheme.surface,
      elevation: 8,
    );
  }
}
