import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String format1() {
    final df = DateFormat("yyyy-MM-dd");
    return df.format(this);
  }
}