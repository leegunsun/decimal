import 'package:dcm/fmhelper.dart';
import 'package:decimal/decimal.dart';


class DecimalCalculator {
  static Decimal? add(dynamic aStr, dynamic bStr) {
    try {

      if(aStr is! String) {
        aStr = aStr.toString();
      }

      if(bStr is! String) {
        bStr = bStr.toString();
      }

      Decimal a = DecimalHelper.encode(aStr);
      Decimal b = DecimalHelper.encode(bStr);

      Decimal result = a + b;

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }

  static Decimal? subtract(dynamic aStr, dynamic bStr) {
    try {

      if(aStr is! String) {
        aStr = aStr.toString();
      }

      if(bStr is! String) {
        bStr = bStr.toString();
      }

      Decimal a = DecimalHelper.encode(aStr);
      Decimal b = DecimalHelper.encode(bStr);

      Decimal result = a - b;

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }

  static Decimal? multiply(dynamic aStr, dynamic bStr) {
    try {

      if(aStr is! String) {
        aStr = aStr.toString();
      }

      if(bStr is! String) {
        bStr = bStr.toString();
      }

      Decimal a = DecimalHelper.encode(aStr);
      Decimal b = DecimalHelper.encode(bStr);

      Decimal result = a * b;

      if (result < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return result;
    } catch (_) {
      return null;
    }
  }

  static Decimal? divide(dynamic aStr, dynamic bStr) {
    try {

      if(aStr is! String) {
        aStr = aStr.toString();
      }

      if(bStr is! String) {
        bStr = bStr.toString();
      }

      Decimal a = DecimalHelper.encode(aStr);
      Decimal b = DecimalHelper.encode(bStr);
      if (a == Decimal.fromInt(0) || b == Decimal.fromInt(0)) {
        throw Exception('Division by zero is not allowed.');
      }
      var result = a / b;
      Decimal decimalResult = result.toDecimal();

      if (decimalResult < Decimal.zero) {
        throw Exception('Negative result not allowed.');
      }
      return decimalResult;
    } catch (_) {
      return null;
    }
  }

  ///////////////////////////////////////////  ///////////////////////////////////////////  ///////////////////////////////////////////


  static Decimal? nm (dynamic totalSket, dynamic sketRateTotal, dynamic rate) {

    try {

      if(rate is! String) {
        rate = rate.toString();
      }

      Decimal? a = subtract(totalSket, sketRateTotal)! * DecimalHelper.encode(rate);
      Decimal? result = divide(a, "100");

      return result;

    } catch (_) {
      return null;
    }
  }