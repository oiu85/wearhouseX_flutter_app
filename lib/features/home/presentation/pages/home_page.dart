import 'package:flutter/material.dart';
import 'package:flutter_app_wearhouse/core/shared/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/status/ui_helper.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../domain/entities/sale_entity.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_greeting_section.dart';
import '../widgets/home_stats_section.dart';
import '../widgets/home_dashboard_stats_section.dart';
import '../widgets/home_recent_sales_section.dart';
import '../widgets/home_quick_actions_section.dart';
import '../widgets/home_low_stock_section.dart';

//* Home dashboard page displaying driver statistics and quick actions
class HomePage extends StatefulWidget {
  final bool isNavigating;

  const HomePage({
    super.key,
    this.isNavigating = false,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final HomeBloc _homeBloc = GetIt.I<HomeBloc>();
  final TextEditingController _searchController = TextEditingController();
  bool _hasInitialized = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //* Load user info and dashboard data only on first mount
    final currentState = _homeBloc.state;
    if (!_hasInitialized && (currentState.status.isInitial() || currentState.dashboard == null)) {
      _homeBloc.add(const LoadUserInfo());
      _homeBloc.add(const LoadDashboard());
      _hasInitialized = true;
    }
    
    //* Sync search controller with state
    _searchController.text = currentState.searchQuery;
    _searchController.addListener(() {
      if (_searchController.text != _homeBloc.state.searchQuery) {
        _homeBloc.add(SearchQueryChanged(_searchController.text));
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _homeBloc.add(const RefreshDashboard());
    // Wait for the refresh to complete by listening to state changes
    // Skip the current state and wait for the next state change
    try {
      await _homeBloc.stream
          .skip(1)
          .firstWhere(
            (state) => state.status.isSuccess() || state.status.isFail(),
          )
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      // Timeout or error - refresh will complete anyway
    }
  }

  void _onCreateSale() {
    _homeBloc.add(const NavigateToCreateSale());
  }

  void _onViewStock() {
    _homeBloc.add(const NavigateToStock());
  }

  void _onViewAllSales() {
    _homeBloc.add(const NavigateToSalesHistory());
  }

  void _onViewLowStock() {
    _homeBloc.add(const NavigateToStock());
  }

  void _onProductTap(int productId) {
    _homeBloc.add(NavigateToStockDetail(productId));
  }

  void _onSaleTap(SaleEntity sale) {
    _homeBloc.add(NavigateToSaleDetail(sale.id));
  }

  void _onSearchChanged(String query) {
    _homeBloc.add(SearchQueryChanged(query));
  }

  void _onNotificationPressed() {
    _homeBloc.add(const NavigateToNotifications());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    final theme = Theme.of(context);

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        return AppScaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: HomeAppBar(
            searchController: _searchController,
            onSearchChanged: _onSearchChanged,
            onNotificationPressed: _onNotificationPressed,
            notificationCount: state.notificationCount,
          ),
          body: BlocListener<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          //* Handle navigation
          if (state.navigationRoute != null) {
            final route = state.navigationRoute!;
            _homeBloc.add(const ClearNavigationRoute());
            context.push(route);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (context, state) {
            return state.status.when(
              init: () => UiHelperStatus(
                state: state.status,
                message: null,
              ),
              loading: () => UiHelperStatus(
                state: state.status,
                message: null,
              ),
              loadingMore: () => RefreshIndicator(
                onRefresh: _onRefresh,
                color: theme.colorScheme.primary,
                child: _buildContent(context, theme, state),
              ),
              success: () => RefreshIndicator(
                onRefresh: _onRefresh,
                color: theme.colorScheme.primary,
                child: _buildContent(context, theme, state),
              ),
              fail: (error) => UiHelperStatus(
                state: state.status,
                message: state.errorMessage,
                onRetry: () {
                  _homeBloc.add(const LoadDashboard());
                },
              ),
            );
          },
        ),
        ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, HomeState state) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        //* Greeting Section
        if (state.greetingText != null)
          SliverToBoxAdapter(
            child: HomeGreetingSection(greetingText: state.greetingText),
          ),

        //* Statistics Section (use dashboard quick stats if available)
        if (state.dashboard != null)
          SliverToBoxAdapter(
            child: HomeDashboardStatsSection(
              quickStats: state.dashboard!.quickStats,
            ),
          )
        else if (state.driverStats != null)
          SliverToBoxAdapter(
            child: HomeStatsSection(stats: state.driverStats!),
          ),

        //* Low Stock Alerts Section
        if (state.dashboard != null &&
            state.dashboard!.lowStockProducts.isNotEmpty)
          SliverToBoxAdapter(
            child: HomeLowStockSection(
              lowStockProducts: state.dashboard!.lowStockProducts,
              onViewAll: _onViewLowStock,
              onProductTap: _onProductTap,
            ),
          ),

        //* Recent Sales Section
        SliverToBoxAdapter(
          child: HomeRecentSalesSection(
            recentSales: state.recentSales,
            onViewAll: _onViewAllSales,
            onSaleTap: _onSaleTap,
          ),
        ),

        //* Quick Actions Section
        SliverToBoxAdapter(
          child: HomeQuickActionsSection(
            onCreateSale: _onCreateSale,
            onViewStock: _onViewStock,
            onViewAllSales: _onViewAllSales,
          ),
        ),
      ],
    );
  }
}
