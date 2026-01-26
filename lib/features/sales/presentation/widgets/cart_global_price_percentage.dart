import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/buttons/custom_filled_button.dart';
import '../../../../core/component/text_fields/custom_text_field.dart';
import '../../../../core/localization/app_text.dart';
import '../../../../core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

/// Global price percentage widget for applying percentage to all cart items
class CartGlobalPricePercentage extends StatefulWidget {
  final ValueChanged<double> onApplyPercentage;

  const CartGlobalPricePercentage({
    super.key,
    required this.onApplyPercentage,
  });

  @override
  State<CartGlobalPricePercentage> createState() =>
      _CartGlobalPricePercentageState();
}

class _CartGlobalPricePercentageState
    extends State<CartGlobalPricePercentage> {
  final TextEditingController _percentageController = TextEditingController();
  double? _previewPercentage;

  @override
  void dispose() {
    _percentageController.dispose();
    super.dispose();
  }

  void _onPercentageChanged(String value) {
    final percentage = double.tryParse(value);
    setState(() {
      _previewPercentage = percentage;
    });
  }

  void _applyPercentage() {
    final percentage = double.tryParse(_percentageController.text);
    if (percentage != null) {
      widget.onApplyPercentage(percentage);
      _percentageController.clear();
      setState(() {
        _previewPercentage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            LocaleKeys.sales_globalPricePercentage,
            translation: true,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _percentageController,
                  hintText: LocaleKeys.sales_enterPercentage.tr(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  prefixIcon: Icon(
                    Icons.percent_rounded,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                  onChanged: _onPercentageChanged,
                ),
              ),
              SizedBox(width: 12.w),
              CustomFilledButton(
                text: LocaleKeys.sales_apply,
                onPressed: _previewPercentage != null ? _applyPercentage : null,
                backgroundColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
                height: 50.h,
                borderRadius: 12.r,
                icon: Icons.check_circle_rounded,
              ),
            ],
          ),
          if (_previewPercentage != null) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 20.sp,
                    color: theme.colorScheme.primary,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: AppText(
                      LocaleKeys.sales_percentagePreview.tr(
                        namedArgs: {'percentage': _previewPercentage!.toStringAsFixed(1)},
                      ),
                      translation: false,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
