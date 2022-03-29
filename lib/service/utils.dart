import 'package:intl/intl.dart';

class Utils {
  static intToIDR(int price) => NumberFormat.simpleCurrency(locale: 'id_ID', name: 'Rp ', decimalDigits: 0).format(price);
}
