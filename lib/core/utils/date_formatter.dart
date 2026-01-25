import 'package:easy_localization/easy_localization.dart';
import '../localization/locale_keys.g.dart';

/// Utility class for formatting dates in the home feature
class DateFormatter {
  DateFormatter._();

  /// Formats a date relative to now (today, yesterday, X days ago, or full date)
  static String formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return LocaleKeys.home_today.tr();
    } else if (difference.inDays == 1) {
      return LocaleKeys.home_yesterday.tr();
    } else if (difference.inDays < 7) {
      return LocaleKeys.home_daysAgo.tr(namedArgs: {'days': '${difference.inDays}'});
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
