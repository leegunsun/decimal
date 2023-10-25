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