import '../../localization/app_text.dart';
import '../../localization/locale_keys.g.dart';
import '../../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    //* Map page index to nav bar index
    // Page: Home=0, Donate=1, Menu=2
    // Nav Bar: Home=0, Menu=1
    int navBarIndex;
    if (selectedIndex == 0) {
      navBarIndex = 0; // Home page → Home nav item
    } else if (selectedIndex == 1) {
      navBarIndex = 0; // Donate page → Use 0 but we'll handle the visual state
    } else {
      navBarIndex = 1; // Menu page → Menu nav item
    }
    
    bool isDonateActive = selectedIndex == 1;
    
    return StylishBottomBar(
      option: AnimatedBarOptions(
        iconSize: 24.sp,
        barAnimation: BarAnimation.blink,
        iconStyle: IconStyle.Default,
        opacity:1,
      ),
      items: [
        //* Home Item
        BottomBarItem(
          icon: SvgPicture.asset(
            Assets.images.svg.icons.homeNavbar.path,
            width: 24.sp,
            height: 24.sp,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            Assets.images.svg.icons.homeNavbar.path,
            width: 24.sp,
            height: 24.sp,
            colorFilter: ColorFilter.mode(
              isDonateActive ? theme.colorScheme.onSurface : theme.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
          title: AppText(
            isAutoScale: true,
            LocaleKeys.bottomNav_home,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          selectedColor: isDonateActive ? theme.colorScheme.onSurface : theme.colorScheme.secondary,
          unSelectedColor: theme.colorScheme.onSurface,
        ),
        
        //* Menu Item
        BottomBarItem(
          icon: SvgPicture.asset(
            Assets.images.svg.icons.menuNavbar.path,
            width: 24.sp,
            height: 24.sp,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            Assets.images.svg.icons.menuNavbar.path,
            width: 24.sp,
            height: 24.sp,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.secondary,
              BlendMode.srcIn,
            ),
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
      currentIndex: navBarIndex,
      onTap: (index) {
        //* Map nav bar index back to page index
        int pageIndex = index == 1 ? 2 : index; // Home=0, Menu=2
        onTap(pageIndex);
      },
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      notchStyle: NotchStyle.circle,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.r),
      ),
      backgroundColor: theme.colorScheme.surface,
      elevation: 8,
    );
  }
}
