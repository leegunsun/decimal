import 'package:dcm/fmhelper.dart';
import 'package:decimal/decimal.dart';

class Calculator {

  static Decimal add(String aStr, String bStr) {
    Decimal a = FormatHelper.decimalEncode(aStr);
    Decimal b = FormatHelper.decimalEncode(bStr);
    // return FormatHelper.format(a + b); // for rawData...
    return a + b;
  }

  static Decimal subtract(String aStr, String bStr) {
    Decimal a = FormatHelper.decimalEncode(aStr);
    Decimal b = FormatHelper.decimalEncode(bStr);
    // return FormatHelper.format(a - b) // for rawData...;
    return a - b;
  }

  static Decimal multiply(String aStr, String bStr) {
    Decimal a = FormatHelper.decimalEncode(aStr);
    Decimal b = FormatHelper.decimalEncode(bStr);
    // return FormatHelper.format(a * b) // for rawData...;
    return a * b;
  }

  static Decimal divide(String aStr, String bStr) {
    Decimal a = FormatHelper.decimalEncode(aStr);
    Decimal b = FormatHelper.decimalEncode(bStr);
    if (b == Decimal.fromInt(0)) {
      throw Exception('Division by zero is not allowed.');
    }
    Decimal result = Decimal.parse((a / b).toString());
    // return FormatHelper.format(result) // for rawData...;
    return result;
  }
}

// static String format(Decimal number) {
//   String result = number.toString(); // 연속된 0을 제거
//   while (result.contains('.') &&
//       (result.endsWith('0') || result.endsWith('.'))) {
//     result = result.substring(0, result.length - 1);
//   } // ','로 숫자를 구분합니다.
//   final formatter = NumberFormat("#,###.##"); // 이 줄을 추가하세요.
//   result = formatter.format(double.parse(result)); // 이 줄을 추가하세요.
//   return result;
// }
