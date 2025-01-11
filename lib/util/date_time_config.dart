import 'package:intl/intl.dart';

var symbolNairaFormatted = NumberFormat.currency(
  locale: "en_US",
  decimalDigits: 2,
  symbol: "₦",
);

String formatCurrentDate(DateTime date) {
  final formatter = DateFormat('MMM d, HH:mm');
  return formatter.format(date);
}
