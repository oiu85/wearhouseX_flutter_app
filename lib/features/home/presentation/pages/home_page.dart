import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/status/ui_helper.dart';
import '../../../../core/component/others/custom_selection_popup.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_greeting_section.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_category_filter.dart';
import '../widgets/stock_item_card.dart';

//* Home page displaying driver's stock
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
    //* Load user info and stock on initial mount
    _homeBloc.add(const LoadUserInfo());
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
    //* Refresh completion is handled in BlocListener
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
      appBar: HomeAppBar(
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        onSortPressed: _showSortDialog,
      ),
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
                    _homeBloc.add(const LoadStock());
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
                      child: HomeGreetingSection(greetingText: state.greetingText),
                    ),

                  //* Search Bar
                  SliverToBoxAdapter(
                    child: HomeSearchBar(
                      controller: _searchController,
                      onChanged: (value) {
                        _homeBloc.add(SearchStock(value));
                      },
                    ),
                  ),

                  //* Category Filter Chips
                  if (state.categories.isNotEmpty)
                    SliverToBoxAdapter(
                      child: HomeCategoryFilter(
                        categories: state.categories,
                        selectedCategoryId: state.selectedCategoryId,
                        onCategorySelected: (categoryId) {
                          _homeBloc.add(FilterByCategory(categoryId));
                        },
                      ),
                    ),

                  //* Stock List
                  if (state.filteredStockItems.isEmpty)
                    SliverFillRemaining(
                      child: NoDataWidget(message: LocaleKeys.home_noStockItems.tr()),
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
