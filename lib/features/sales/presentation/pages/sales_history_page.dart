import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';
import '../widgets/sale_item_card.dart';

/// Sales history page
class SalesHistoryPage extends StatefulWidget {
  const SalesHistoryPage({super.key});

  @override
  State<SalesHistoryPage> createState() => _SalesHistoryPageState();
}

class _SalesHistoryPageState extends State<SalesHistoryPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final TextEditingController _searchController = TextEditingController();
  final SalesListBloc _salesListBloc = GetIt.I<SalesListBloc>();

  @override
  void initState() {
    super.initState();
    _salesListBloc.add(const LoadSales());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    _salesListBloc.add(const RefreshSales());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: AppText(
          'sales.salesHistory',
          translation: true,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<SalesListBloc, SalesListState>(
        bloc: _salesListBloc,
        listener: (context, state) {
          if (state.status.isSuccess() && _refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          } else if (state.status.isFail() && _refreshController.isRefresh) {
            _refreshController.refreshFailed();
          }
        },
        child: BlocBuilder<SalesListBloc, SalesListState>(
          bloc: _salesListBloc,
          builder: (context, state) {
            if (state.status.isLoading() || state.status.isInitial()) {
              return Center(
                child: CircularProgressIndicator(color: theme.colorScheme.primary),
              );
            }

            if (state.status.isFail()) {
              return Center(
                child: UiHelperStatus(
                  state: state.status,
                  message: state.errorMessage,
                  onRetry: () {
                    _salesListBloc.add(const LoadSales());
                  },
                ),
              );
            }

            return SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              enablePullDown: true,
              enablePullUp: false,
              header: WaterDropMaterialHeader(
                backgroundColor: theme.colorScheme.primary,
                color: theme.colorScheme.surface,
              ),
              child: state.filteredSales.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 64.sp,
                            color: theme.colorScheme.onSurface.withOpacity(0.3),
                          ),
                          SizedBox(height: 16.h),
                          AppText(
                            'sales.noSales',
                            translation: true,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(16.w),
                      itemCount: state.filteredSales.length,
                      itemBuilder: (context, index) {
                        final sale = state.filteredSales[index];
                        return SaleItemCard(
                          sale: sale,
                          onTap: () {
                            context.push('${AppRoutes.saleDetail}/${sale.id}');
                          },
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
