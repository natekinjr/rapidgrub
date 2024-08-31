import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  final format = NumberFormat.currency(symbol: 'KES ', decimalDigits: 2);
  return format.format(amount);
}
