import 'package:dcm/fmhelper.dart';
import 'package:decimal/decimal.dart';

class DecimalCalculator {
  static Decimal? add(String aStr, String bStr) {
    try {
      Decimal a = DecimalHelper.decimalEncode(aStr);
      Decimal b = DecimalHelper.decimalEncode(bStr);

      Decimal result = a + b;

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }

  static Decimal? subtract(String aStr, String bStr) {
    try {
      Decimal a = DecimalHelper.decimalEncode(aStr);
      Decimal b = DecimalHelper.decimalEncode(bStr);

      Decimal result = a - b;

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }

  static Decimal? multiply(String aStr, String bStr) {
    try {
      Decimal a = DecimalHelper.decimalEncode(aStr);
      Decimal b = DecimalHelper.decimalEncode(bStr);

      Decimal result = a * b;

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }

  static Decimal? divide(String aStr, String bStr) {
    try {
      Decimal a = DecimalHelper.decimalEncode(aStr);
      Decimal b = DecimalHelper.decimalEncode(bStr);
      if (a == Decimal.fromInt(0) || b == Decimal.fromInt(0)) {
        throw Exception('Division by zero is not allowed.');
      }
      Decimal result = Decimal.parse((a / b).toString());

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }
}
