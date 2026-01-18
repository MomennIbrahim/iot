import 'package:intl/intl.dart';

class DateHelper {
  static String formatArabicDate(String dateString) {
    final dateTime = DateTime.parse(dateString);
    return DateFormat('d MMMM y', 'ar').format(dateTime);
  }

  static String getDaysRemainingBetweenTwoDates(
    String startDate,
    String endDate,
  ) {
    final start = DateTime.parse(startDate);
    final end = DateTime.parse(endDate);
    final difference = end.difference(start);
    return difference.inDays.toString();
  }
}
