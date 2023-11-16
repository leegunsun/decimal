import 'package:flutter/services.dart';

class CustomNumberInputFormatter extends TextInputFormatter {
  final RegExp _allowedPattern = RegExp(r'^[0-9,]*(\.[0-9,]*)?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 전체 문자열이 정규식과 일치하는지 확인합니다.
    if (!_allowedPattern.hasMatch(newValue.text)) {
      return oldValue;
    }

    final newText = newValue.text;
    final dotIndex = newText.indexOf('.');

    if (dotIndex == -1) {
      if (newText.length > 17) return oldValue;
      return TextEditingValue(
        text: _formatNumber(newText),
        selection: newValue.selection,
      );
    }

    final integerPart = newText.substring(0, dotIndex);
    final decimalPart = newText.substring(dotIndex + 1);

    if (integerPart.length > 17 || decimalPart.length > 18) return oldValue;

    return TextEditingValue(
      text: '${_formatNumber(integerPart)}.$decimalPart',
      selection: newValue.selection,
    );
  }

  String _formatNumber(String number) {
    if (number.isEmpty) {
      return '';
    }

    final numericOnly = number.replaceAll(',', '');
    final formatter = NumberFormat('#,##0');

    return formatter.format(int.tryParse(numericOnly) ?? 0);
  }
}