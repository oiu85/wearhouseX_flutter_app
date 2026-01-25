import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../widgets/home_greeting_section.dart';
import '../widgets/home_stats_section.dart';
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

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final HomeBloc _homeBloc = GetIt.I<HomeBloc>();

  @override
  void initState() {
    super.initState();
    //* Load user info and dashboard data on initial mount
    _homeBloc.add(const LoadUserInfo());
    _homeBloc.add(const LoadDashboard());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    _homeBloc.add(const RefreshDashboard());
  }

  void _onCreateSale() {
    //* Navigate to create sale page
    context.push(AppRoutes.createSale);
  }

  void _onViewStock() {
    //* Navigate to stock page (will be handled by MainNavigationPage)
    //* For now, just navigate via router
    context.push(AppRoutes.stock);
  }

  void _onViewAllSales() {
    //* Navigate to sales history page
    context.push(AppRoutes.salesHistory);
  }

  void _onViewLowStock() {
    //* Navigate to stock page with low stock filter
    context.push(AppRoutes.stock);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocListener<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          //* Complete refresh when state changes to success
          if (state.status.isSuccess() && _refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          } else if (state.status.isFail() && _refreshController.isRefresh) {
            _refreshController.refreshFailed();
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (context, state) {
            //* Show loading state
            if (state.status.isLoading() || state.status.isInitial()) {
              return Center(
                child: CircularProgressIndicator(color: theme.colorScheme.primary),
              );
            }

            //* Show error state
            if (state.status.isFail()) {
              return Center(
                child: UiHelperStatus(
                  state: state.status,
                  message: state.errorMessage,
                  onRetry: () {
                    _homeBloc.add(const LoadDashboard());
                  },
                ),
              );
            }

            //* Show success state with dashboard
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              enablePullDown: true,
              enablePullUp: false,
              header: WaterDropMaterialHeader(
                backgroundColor: theme.colorScheme.primary,
                color: theme.colorScheme.surface,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Greeting Section
                    if (state.greetingText != null)
                      HomeGreetingSection(greetingText: state.greetingText),

                    //* Statistics Section (use dashboard quick stats if available)
                    if (state.dashboard != null)
                      _buildDashboardStats(context, theme, state.dashboard!.quickStats)
                    else if (state.driverStats != null)
                      HomeStatsSection(stats: state.driverStats!),

                    //* Low Stock Alerts Section
                    if (state.dashboard != null &&
                        state.dashboard!.lowStockProducts.isNotEmpty)
                      HomeLowStockSection(
                        lowStockProducts: state.dashboard!.lowStockProducts,
                        onViewAll: _onViewLowStock,
                      ),

                    //* Recent Sales Section
                    HomeRecentSalesSection(
                      recentSales: state.recentSales,
                      onViewAll: _onViewAllSales,
                    ),

                    //* Quick Actions Section
                    HomeQuickActionsSection(
                      onCreateSale: _onCreateSale,
                      onViewStock: _onViewStock,
                      onViewAllSales: _onViewAllSales,
                    ),

                    SizedBox(height: 100.h), //* Space for bottom nav bar
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardStats(
    BuildContext context,
    ThemeData theme,
    QuickStatsEntity quickStats,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1.5,
            children: [
              _buildStatCard(
                context,
                theme,
                'dashboard.todaySales',
                '${quickStats.todaySales}',
                Icons.shopping_cart,
                theme.colorScheme.primary,
              ),
              _buildStatCard(
                context,
                theme,
                'dashboard.todayRevenue',
                '\$${quickStats.todayRevenue.toStringAsFixed(2)}',
                Icons.attach_money,
                theme.colorScheme.secondary,
              ),
              _buildStatCard(
                context,
                theme,
                'dashboard.availableProducts',
                '${quickStats.availableProducts}',
                Icons.inventory_2,
                theme.colorScheme.tertiary,
              ),
              _buildStatCard(
                context,
                theme,
                'dashboard.lowStockAlerts',
                '${quickStats.lowStockAlerts}',
                Icons.warning_amber_rounded,
                quickStats.lowStockAlerts > 0
                    ? theme.colorScheme.error
                    : theme.colorScheme.primaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    ThemeData theme,
    String labelKey,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: AppText(
                  labelKey,
                  translation: true,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          AppText(
            value,
            translation: false,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
