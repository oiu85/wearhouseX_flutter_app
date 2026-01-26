import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/shared/app_scaffold.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/di/app_dependencies.dart';
import '../bloc/stock_request_bloc.dart';
import '../bloc/stock_request_event.dart';
import '../bloc/stock_request_state.dart';
import '../widgets/stock_request_form.dart';

/// Stock request page
class StockRequestPage extends StatelessWidget {
  final int? productId;
  final String? productName;
  final int? initialQuantity;

  const StockRequestPage({
    super.key,
    this.productId,
    this.productName,
    this.initialQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stockRequestBloc = getIt<StockRequestBloc>();

    return BlocProvider.value(
      value: stockRequestBloc,
      child: BlocListener<StockRequestBloc, StockRequestState>(
        listener: (context, state) {
          // Handle snackbar messages
          if (state.snackbarMessage != null) {
            if (state.showSuccessSnackbar) {
              AppSnackbar.showSuccess(
                context,
                state.snackbarMessage!,
              );
            } else {
              AppSnackbar.showError(
                context,
                state.snackbarMessage!,
              );
            }
            // Clear snackbar message
            context.read<StockRequestBloc>().add(const ClearSnackbarMessage());
          }

          // Handle navigation
          if (state.shouldPop) {
            context.pop(true);
          }
        },
        child: AppScaffold(
          appBar: AppBar(
            title: AppText(
              LocaleKeys.stockRequest_title,
              style: theme.textTheme.titleLarge,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: StockRequestForm(
              productId: productId,
              productName: productName,
              initialQuantity: initialQuantity,
            ),
          ),
        ),
      ),
    );
  }
}
