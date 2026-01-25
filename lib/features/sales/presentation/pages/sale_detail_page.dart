import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_wearhouse/core/localization/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/shared/app_snackbar.dart';
import '../../../../core/status/ui_helper.dart';
import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';

/// Sale detail page
class SaleDetailPage extends StatefulWidget {
  final int saleId;

  const SaleDetailPage({
    super.key,
    required this.saleId,
  });

  @override
  State<SaleDetailPage> createState() => _SaleDetailPageState();
}

class _SaleDetailPageState extends State<SaleDetailPage> {
  final SaleDetailBloc _saleDetailBloc = GetIt.I<SaleDetailBloc>();
  bool _wasDownloading = false;

  @override
  void initState() {
    super.initState();
    _saleDetailBloc.add(LoadSaleDetail(widget.saleId));
  }

  @override
  void dispose() {
    _saleDetailBloc.add(const ResetSaleDetail());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    return BlocListener<SaleDetailBloc, SaleDetailState>(
      bloc: _saleDetailBloc,
      listenWhen: (previous, current) {
        // Listen when download/share state changes or error occurs
        return previous.isDownloadingInvoice != current.isDownloadingInvoice ||
            previous.isSharingInvoice != current.isSharingInvoice ||
            (current.errorMessage != null &&
                (current.errorMessage!.contains('download') ||
                    current.errorMessage!.contains('share') ||
                    current.errorMessage!.contains('PDF') ||
                    current.errorMessage!.contains('Failed')));
      },
      listener: (context, state) {
        // Handle download success - show snackbar when download completes successfully
        if (_wasDownloading &&
            !state.isDownloadingInvoice &&
            state.errorMessage == null &&
            state.sale != null) {
          AppSnackbar.showSuccess(
            context,
            'sales.downloadSuccess',
            translation: true,
          );
        }
        // Update tracking variable
        _wasDownloading = state.isDownloadingInvoice;
        
        // Handle download/share errors
        if (state.errorMessage != null &&
            (state.errorMessage!.contains('download') ||
                state.errorMessage!.contains('share') ||
                state.errorMessage!.contains('PDF') ||
                state.errorMessage!.contains('Failed'))) {
          AppSnackbar.showError(
            context,
            state.errorMessage!,
            translation: false,
          );
        }
        // Handle share success
        if (!state.isSharingInvoice && state.sale != null) {
          // Share dialog is shown by the service
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: AppText(
            LocaleKeys.sales_saleDetails
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<SaleDetailBloc, SaleDetailState>(
          bloc: _saleDetailBloc,
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
                  _saleDetailBloc.add(LoadSaleDetail(widget.saleId));
                },
              ),
            );
          }

          if (state.sale == null) {
            return const SizedBox.shrink();
          }

          final sale = state.sale!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Invoice Number
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'sales.invoiceNumber',
                                translation: true,
                                style: theme.textTheme.bodyMedium,
                              ),
                              AppText(
                                sale.invoiceNumber,
                                translation: false,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      // Customer Name
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'sales.customerName',
                                translation: true,
                                style: theme.textTheme.bodyMedium,
                              ),
                              AppText(
                                sale.customerName,
                                translation: false,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      // Date
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'sales.date',
                                translation: true,
                                style: theme.textTheme.bodyMedium,
                              ),
                              AppText(
                                dateFormat.format(sale.createdAt),
                                translation: false,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      // Items List
                      AppText(
                        'sales.items',
                        translation: true,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ...sale.items.map((item) => Card(
                            margin: EdgeInsets.only(bottom: 8.h),
                            child: ListTile(
                              title: AppText(
                                item.productName,
                                translation: false,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: AppText(
                                '${item.quantity} × \$${item.price.toStringAsFixed(2)}',
                                translation: false,
                              ),
                              trailing: AppText(
                                '\$${item.subtotal.toStringAsFixed(2)}',
                                translation: false,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 16.h),
                      // Total Amount
                      Card(
                        color: theme.colorScheme.primaryContainer,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'sales.totalAmount',
                                translation: true,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AppText(
                                '\$${sale.totalAmount.toStringAsFixed(2)}',
                                translation: false,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 100.h), // Space for bottom buttons
                    ],
                  ),
                ),
              ),
              // Action Buttons
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomFilledButton(
                          text: 'sales.downloadInvoice',
                          onPressed: state.isDownloadingInvoice
                              ? null
                              : () {
                                  _saleDetailBloc.add(DownloadInvoice(widget.saleId));
                                },
                          backgroundColor: theme.colorScheme.secondary,
                          textColor: theme.colorScheme.onSecondary,
                          icon: Icons.download,
                          isLoading: state.isDownloadingInvoice,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomFilledButton(
                          text: 'sales.shareInvoice',
                          onPressed: state.isSharingInvoice
                              ? null
                              : () {
                                  _saleDetailBloc.add(ShareInvoice(widget.saleId));
                                },
                          backgroundColor: theme.colorScheme.primary,
                          textColor: theme.colorScheme.onPrimary,
                          icon: Icons.share,
                          isLoading: state.isSharingInvoice,
                        ),
                      ),
                    ],
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
