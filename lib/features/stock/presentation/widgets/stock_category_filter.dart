import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/others/selection_chip.dart';
import '../../domain/entities/category_entity.dart';

//* Category filter chips widget
class StockCategoryFilter extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int? selectedCategoryId;
  final ValueChanged<int?> onCategorySelected;

  const StockCategoryFilter({
    super.key,
    required this.categories,
    this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              //* All Categories chip
              SelectionChip(
                label: 'home.allCategories'.tr(),
                isSelected: selectedCategoryId == null,
                onTap: () => onCategorySelected(null),
              ),
              SizedBox(width: 8.w),
              //* Category chips
              ...categories.map((category) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: SelectionChip(
                    label: category.name,
                    isSelected: selectedCategoryId == category.id,
                    onTap: () => onCategorySelected(category.id),
                  ),
                );
              }),
            ],
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
