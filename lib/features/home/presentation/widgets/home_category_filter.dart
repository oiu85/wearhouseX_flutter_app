import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/others/selection_chip.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../domain/entities/category_entity.dart';

//* Category filter chips widget
class HomeCategoryFilter extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int? selectedCategoryId;
  final ValueChanged<int?> onCategorySelected;

  const HomeCategoryFilter({
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
                label: LocaleKeys.home_allCategories.tr(),
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
