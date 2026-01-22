import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/component/others/selection_chip.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/status/bloc_status.dart';
import '../../../../core/component/others/custom_selection_popup.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/stock_item_card.dart';

/// Home page displaying driver's stock
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final TextEditingController _searchController = TextEditingController();
  final HomeBloc _homeBloc = GetIt.I<HomeBloc>();

  @override
  void initState() {
    super.initState();
    // Load stock on initial mount
    _homeBloc.add(const LoadStock());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    _homeBloc.add(const RefreshStock());
    // Refresh completion is handled in BlocListener
  }

  void _showSortDialog() {
    final state = _homeBloc.state;
    CustomSelectionPopup.show(
      context,
      title: LocaleKeys.home_sortBy.tr(),
      options: [
        SelectionOption(
          label: LocaleKeys.home_sortByName.tr(),
          isSelected: state.sortType == SortType.name,
          onTap: () {
            Navigator.pop(context);
            _homeBloc.add(const SortStock(SortType.name));
          },
        ),
        SelectionOption(
          label: LocaleKeys.home_sortByQuantity.tr(),
          isSelected: state.sortType == SortType.quantity,
          onTap: () {
            Navigator.pop(context);
            _homeBloc.add(const SortStock(SortType.quantity));
          },
        ),
        SelectionOption(
          label: LocaleKeys.home_sortByPrice.tr(),
          isSelected: state.sortType == SortType.price,
          onTap: () {
            Navigator.pop(context);
            _homeBloc.add(const SortStock(SortType.price));
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
      appBar: AppBar(
        title: AppText(
          LocaleKeys.home_stockList.tr(),
          translation: false,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Sort button
          IconButton(
            icon: Icon(
              Icons.sort,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: _showSortDialog,
            tooltip: LocaleKeys.home_sortBy.tr(),
          ),
        ],
      ),
      body: BlocListener<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          // Complete refresh when state changes to success
          if (state.status.isSuccess() && _refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          } else if (state.status.isFail() && _refreshController.isRefresh) {
            _refreshController.refreshFailed();
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (context, state) {
            // Show loading/error states
            if (state.status.isLoading() || state.status.isInitial()) {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              );
            }

            if (state.status.isFail()) {
              return Center(
                child: UiHelperStatus(
                  state: state.status,
                  message: state.errorMessage,
                  onRetry: () {
                    _homeBloc.add(const LoadStock());
                  },
                ),
              );
            }

          return Column(
            children: [
              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: CustomTextField(
                  controller: _searchController,
                  hintText: LocaleKeys.home_searchProducts.tr(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                  onChanged: (value) {
                    _homeBloc.add(SearchStock(value));
                  },
                ),
              ),

              // Category Filter Chips
              if (state.categories.isNotEmpty) ...[
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    children: [
                      // All Categories chip
                      SelectionChip(
                        label: LocaleKeys.home_allCategories.tr(),
                        isSelected: state.selectedCategoryId == null,
                        onTap: () {
                          _homeBloc.add(const FilterByCategory(null));
                        },
                      ),
                      SizedBox(width: 8.w),
                      // Category chips
                      ...state.categories.map((category) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: SelectionChip(
                            label: category.name,
                            isSelected: state.selectedCategoryId == category.id,
                            onTap: () {
                              _homeBloc.add(FilterByCategory(category.id));
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
              ],

              // Stock List
              Expanded(
                child: state.filteredStockItems.isEmpty
                    ? NoDataWidget(
                        message: LocaleKeys.home_noStockItems.tr(),
                      )
                    : SimplePullToRefresh(
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          itemCount: state.filteredStockItems.length,
                          itemBuilder: (context, index) {
                            final stockItem = state.filteredStockItems[index];
                            return StockItemCard(
                              stockItem: stockItem,
                              onTap: () {
                                // TODO: Navigate to product details
                              },
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
