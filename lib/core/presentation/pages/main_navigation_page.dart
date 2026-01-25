import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../component/others/custom_bottom_nav_bar.dart';
import '../../di/app_dependencies.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/home/presentation/bloc/home_event.dart' as home_event;
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/menu/presentation/pages/menu_page.dart';
import '../../../features/stock/presentation/bloc/stock_bloc.dart';
import '../../../features/stock/presentation/pages/stock_page.dart';

class MainNavigationPage extends StatefulWidget {
  final int initialIndex;

  const MainNavigationPage({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late PageController _pageController;
  late int _currentIndex;
  late HomeBloc _homeBloc;
  late StockBloc _stockBloc;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    
    // Initialize BLoCs to share data across tabs
    _homeBloc = getIt<HomeBloc>();
    _stockBloc = getIt<StockBloc>();
    
    // Load initial data
    _homeBloc.add(const home_event.LoadUserInfo());
    _homeBloc.add(const home_event.LoadDashboard());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      // Mark navigation as complete after a short delay
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) {
          setState(() {
            _isNavigating = false;
          });
        }
      });
    });
  }

  void _onNavBarTap(int index) {
    // Only set navigating flag if actually changing pages
    if (index != _currentIndex) {
      setState(() {
        _isNavigating = true;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Depend on locale to rebuild when language changes
    final _ = context.locale;

    return BlocProvider.value(
      value: _homeBloc,
      child: BlocProvider.value(
        value: _stockBloc,
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(), // Disable swipe - navigate only via bottom nav bar
            children: [
              HomePage(isNavigating: _isNavigating),
              StockPage(),
              const MenuPage(),
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: _currentIndex,
            onTap: _onNavBarTap,
          ),
        ),
      ),
    );
  }
}
