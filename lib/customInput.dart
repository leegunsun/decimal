import 'package:flutter/services.dart';

class CustomNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 숫자와 소수점만 허용
    final newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // 소수점 위치 찾기
    final dotIndex = newText.indexOf('.');

    // 소수점이 없는 경우
    if (dotIndex == -1) {
      if (newText.length > 23) return oldValue;
      return TextEditingValue(
        text: newText,
        selection: newValue.selection,
      );
    }

    // 소수점이 있는 경우
    final integerPart = newText.substring(0, dotIndex);
    final decimalPart = newText.substring(dotIndex + 1);

    if (integerPart.length > 23 || decimalPart.length > 18) return oldValue;

    return TextEditingValue(
      text: '$integerPart.$decimalPart',
      selection: newValue.selection,
    );
  }
}
