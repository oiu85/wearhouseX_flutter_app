import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/status/ui_helper.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_greeting_section.dart';
import '../widgets/home_stats_section.dart';
import '../widgets/home_recent_sales_section.dart';
import '../widgets/home_quick_actions_section.dart';

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
    context.push('/sales/create');
  }

  void _onViewStock() {
    //* Navigate to stock page (will be handled by MainNavigationPage)
    //* For now, just navigate via router
    context.push('/stock');
  }

  void _onViewAllSales() {
    //* Navigate to all sales page (to be implemented)
    //* For now, just show a placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          'menu.comingSoon',
          translation: true,
        ),
      ),
    );
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

                    //* Statistics Section
                    if (state.driverStats != null)
                      HomeStatsSection(stats: state.driverStats!),

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
}
