import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/component/others/custom_selection_popup.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/stock_bloc.dart';
import '../bloc/stock_event.dart';
import '../bloc/stock_state.dart';
import '../widgets/stock_search_bar.dart';
import '../widgets/stock_category_filter.dart';
import '../widgets/stock_item_card.dart';
import '../widgets/stock_statistics_widget.dart';

//* Stock page displaying driver's stock
class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();
  final StockBloc _stockBloc = GetIt.I<StockBloc>();
  bool _hasInitialized = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //* Load user info, stock, and statistics only on first mount
    final currentState = _stockBloc.state;
    if (!_hasInitialized && (currentState.status.isInitial() || currentState.stockItems.isEmpty)) {
      _stockBloc.add(const LoadUserInfo());
      _stockBloc.add(const LoadStock());
      _stockBloc.add(const LoadStockStatistics());
      _hasInitialized = true;
    }
    
    //* Sync search controller with state
    _searchController.text = currentState.searchQuery;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _stockBloc.add(const RefreshStock());
    // Wait for the refresh to complete by listening to state changes
    try {
      await _stockBloc.stream
          .skip(1)
          .firstWhere(
            (state) => state.status.isSuccess() || state.status.isFail(),
          )
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      // Timeout or error - refresh will complete anyway
    }
  }

  void _showSortDialog() {
    final state = _stockBloc.state;
    CustomSelectionPopup.show(
      context,
      title: LocaleKeys.home_sortBy,
      options: [
        SelectionOption(
          label: LocaleKeys.home_sortByName,
          isSelected: state.sortType == SortType.name,
          onTap: () {
            Navigator.pop(context);
            _stockBloc.add(const SortStock(SortType.name));
          },
        ),
        SelectionOption(
          label: LocaleKeys.home_sortByQuantity,
          isSelected: state.sortType == SortType.quantity,
          onTap: () {
            Navigator.pop(context);
            _stockBloc.add(const SortStock(SortType.quantity));
          },
        ),
        SelectionOption(
          label: LocaleKeys.home_sortByPrice,
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
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    final theme = Theme.of(context);

    return BlocBuilder<StockBloc, StockState>(
      bloc: _stockBloc,
      builder: (context, state) {
        return AppScaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: BlocBuilder<StockBloc, StockState>(
            bloc: _stockBloc,
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
                    _stockBloc.add(const LoadStock());
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, StockState state) {
    return SafeArea(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          //* Stock Statistics Widget
          if (state.stockStatistics != null)
            SliverToBoxAdapter(
              child: StockStatisticsWidget(
                statistics: state.stockStatistics!,
              ),
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
      
          //* Stock List - Shows filtered items based on category and search
          if (state.filteredStockItems.isEmpty)
            SliverFillRemaining(
              child: NoDataWidget(message: LocaleKeys.home_noStockItems),
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
                        // Navigate using productId (backend API uses productId)
                        context.push(
                          '/stock/product/${stockItem.productId}',
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
  }
}
