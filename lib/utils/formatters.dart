import 'package:intl/intl.dart';

/// Formats a number as Sri Lankan Rupees, e.g. 8990 -> "Rs. 8,990".
String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: 'Rs. ',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}
