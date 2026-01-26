import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';

/// Search field widget for multi-select dropdown
/// All logic is in the BLoC - this is a pure UI component
class CartMultiSelectSearchField extends StatefulWidget {
  const CartMultiSelectSearchField({super.key});

  @override
  State<CartMultiSelectSearchField> createState() =>
      _CartMultiSelectSearchFieldState();
}

class _CartMultiSelectSearchFieldState
    extends State<CartMultiSelectSearchField> {
  final CreateSaleBloc _createSaleBloc = GetIt.I<CreateSaleBloc>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _createSaleBloc.add(SearchProducts(_searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomTextField(
      controller: _searchController,
      hintText: LocaleKeys.sales_searchProducts.tr(),
      prefixIcon: Icon(
        Icons.search_rounded,
        color: theme.colorScheme.onSurface.withOpacity(0.6),
      ),
    );
  }
}
