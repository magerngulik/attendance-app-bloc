import 'package:intl/intl.dart';

class ConvertToRupiah {
  String formatRupiah({required int value}) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return formatCurrency.format(value);
  }
}
