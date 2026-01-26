import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/sales/presentation/bloc/sales_state.dart';
import '../../../features/sales/presentation/bloc/sales_event.dart';
import '../../component/others/custom_bottom_nav_bar.dart';
import '../../di/app_dependencies.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/home/presentation/bloc/home_event.dart' as home_event;
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/menu/presentation/pages/menu_page.dart';
import '../../../features/sales/presentation/pages/cart_page.dart';
import '../../../features/sales/presentation/bloc/sales_bloc.dart';
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
  late CreateSaleBloc _createSaleBloc;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    
    // Initialize BLoCs to share data across tabs (singletons from GetIt)
    _homeBloc = getIt<HomeBloc>();
    _stockBloc = getIt<StockBloc>();
    _createSaleBloc = getIt<CreateSaleBloc>();
    
    // Load initial data only if not already loaded
    // Pages will check their state and only load if needed
    final homeState = _homeBloc.state;
    if (homeState.status.isInitial() || homeState.dashboard == null) {
      _homeBloc.add(const home_event.LoadUserInfo());
      _homeBloc.add(const home_event.LoadDashboard());
    }
    
    // Load cart from storage if not already loaded
    final cartState = _createSaleBloc.state;
    if (cartState.status.isInitial() || cartState.cartItems.isEmpty) {
      _createSaleBloc.add(const LoadCartFromStorage());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      //* Mark navigation as complete after a short delay
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
    // * Depend on locale to rebuild when language changes
    final _ = context.locale;

    return BlocProvider.value(
      value: _homeBloc,
      child: BlocProvider.value(
        value: _stockBloc,
        child: BlocProvider.value(
          value: _createSaleBloc,
          child: Scaffold(
            body: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const NeverScrollableScrollPhysics(), //*  Disable swipe - navigate only via bottom nav bar
              children: [
                HomePage(isNavigating: _isNavigating),
                StockPage(),
                const CartPage(),
                const MenuPage(),
              ],
            ),
            bottomNavigationBar: BlocBuilder<CreateSaleBloc, CreateSaleState>(
              bloc: _createSaleBloc,
              builder: (context, cartState) {
                return CustomBottomNavBar(
                  selectedIndex: _currentIndex,
                  onTap: _onNavBarTap,
                  cartItemCount: cartState.cartItems.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
