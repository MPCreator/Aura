import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatMonth(DateTime date) {
    return DateFormat.MMMM('es_ES').format(date);
  }

  static DateTime parseDate(String dateString) {
    if (dateString.contains('/')) {
      return DateFormat('dd/MM/yyyy').parse(dateString);
    } else if (dateString.contains('-')) {
      final datePart = dateString.split(' at ').first;
      return DateTime.parse(datePart);
    }
    throw FormatException("Formato de fecha no soportado: $dateString");
  }
}
