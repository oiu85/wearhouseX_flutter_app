import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/component/others/custom_selection_popup.dart';
import '../bloc/stock_bloc.dart';
import '../bloc/stock_event.dart';
import '../bloc/stock_state.dart';
import '../widgets/stock_app_bar.dart';
import '../widgets/stock_greeting_section.dart';
import '../widgets/stock_search_bar.dart';
import '../widgets/stock_category_filter.dart';
import '../widgets/stock_item_card.dart';

//* Stock page displaying driver's stock
class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final TextEditingController _searchController = TextEditingController();
  final StockBloc _stockBloc = GetIt.I<StockBloc>();

  @override
  void initState() {
    super.initState();
    //* Load user info and stock on initial mount
    _stockBloc.add(const LoadUserInfo());
    _stockBloc.add(const LoadStock());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    _stockBloc.add(const RefreshStock());
    //* Refresh completion is handled in BlocListener
  }

  void _showSortDialog() {
    final state = _stockBloc.state;
    CustomSelectionPopup.show(
      context,
      title: 'home.sortBy'.tr(),
      options: [
        SelectionOption(
          label: 'home.sortByName'.tr(),
          isSelected: state.sortType == SortType.name,
          onTap: () {
            Navigator.pop(context);
            _stockBloc.add(const SortStock(SortType.name));
          },
        ),
        SelectionOption(
          label: 'home.sortByQuantity'.tr(),
          isSelected: state.sortType == SortType.quantity,
          onTap: () {
            Navigator.pop(context);
            _stockBloc.add(const SortStock(SortType.quantity));
          },
        ),
        SelectionOption(
          label: 'home.sortByPrice'.tr(),
          isSelected: state.sortType == SortType.price,
          onTap: () {
            Navigator.pop(context);
            _stockBloc.add(const SortStock(SortType.price));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: StockAppBar(
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        onSortPressed: _showSortDialog,
      ),
      body: BlocListener<StockBloc, StockState>(
        bloc: _stockBloc,
        listener: (context, state) {
          //* Complete refresh when state changes to success
          if (state.status.isSuccess() && _refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          } else if (state.status.isFail() && _refreshController.isRefresh) {
            _refreshController.refreshFailed();
          }
        },
        child: BlocBuilder<StockBloc, StockState>(
          bloc: _stockBloc,
          builder: (context, state) {
            //* Show loading/error states
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
                    _stockBloc.add(const LoadStock());
                  },
                ),
              );
            }

            //* Use CustomScrollView with SliverAppBar for pull-to-refresh in app bar area
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              enablePullDown: true,
              enablePullUp: false,
              physics: const AlwaysScrollableScrollPhysics(),
              header: WaterDropMaterialHeader(
                backgroundColor: theme.colorScheme.primary,
                color: theme.colorScheme.surface,
              ),
              child: CustomScrollView(
                slivers: [
                  //* Greeting Section
                  if (state.greetingText != null)
                    SliverToBoxAdapter(
                      child: StockGreetingSection(greetingText: state.greetingText),
                    ),

                  //* Search Bar
                  SliverToBoxAdapter(
                    child: StockSearchBar(
                      controller: _searchController,
                      onChanged: (value) {
                        _stockBloc.add(SearchStock(value));
                      },
                    ),
                  ),

                  //* Category Filter Chips
                  if (state.categories.isNotEmpty)
                    SliverToBoxAdapter(
                      child: StockCategoryFilter(
                        categories: state.categories,
                        selectedCategoryId: state.selectedCategoryId,
                        onCategorySelected: (categoryId) {
                          _stockBloc.add(FilterByCategory(categoryId));
                        },
                      ),
                    ),

                  //* Stock List
                  if (state.filteredStockItems.isEmpty)
                    SliverFillRemaining(
                      child: NoDataWidget(message: 'home.noStockItems'.tr()),
                    )
                  else
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final stockItem = state.filteredStockItems[index];
                            return StockItemCard(
                              stockItem: stockItem,
                              onTap: () {
                                context.push(
                                  '/stock/${stockItem.id}',
                                );
                              },
                            );
                          },
                          childCount: state.filteredStockItems.length,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
