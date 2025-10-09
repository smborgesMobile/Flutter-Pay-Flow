import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String rawValue = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (rawValue.isEmpty) {
      return TextEditingValue();
    }

    double value = double.parse(rawValue) / 100;
    String newText = NumberFormat.simpleCurrency(locale: "pt_BR").format(value);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
