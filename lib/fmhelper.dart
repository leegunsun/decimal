import 'package:decimal/decimal.dart';

class DecimalHelper {

  // String 타입의 숫자를 Decimal 타입으로 변환하는 메서드
  static Decimal decimalEncode(String number) {
    return Decimal.parse(number);
  }

  // Decimal 타입의 숫자를 String 타입으로 변환하는 메서드
  static String decimalDecode(Decimal number) {
    return number.toStringAsFixed(18);
  }

  // 유저의 화면에 표현할 displayFormat ex) 1,000.000000000000000001
  static String displayFormat(Decimal number) {
    String str = number.toString();

    // 정수 부분과 소수점 이하 부분으로 나눕니다.
    List<String> parts = str.split('.');

    // 정수 부분에 천 단위마다 쉼표를 추가합니다.
    String intPart = parts[0];
    String reversedIntPart = intPart
        .split('')
        .reversed
        .join();
    String formattedIntPart = RegExp(r'.{1,3}')
        .allMatches(reversedIntPart)
        .map((match) => match.group(0))
        .join(',');
    formattedIntPart = formattedIntPart
        .split('')
        .reversed
        .join();

    if (parts.length > 1) {
      // 소수점 아래 부분이 18자리를 초과하면 18자리까지만 가져옵니다.
      if (parts[1].length > 18) {
        String truncated = parts[1].substring(0, 18);
        if (int.parse(parts[1][18]) >= 5) {
          Decimal increment = Decimal.parse('0.' + '0' * 17 + '1');
          number += increment;
          return decimalDecode(number); // 숫자를 수정한 후에 다시 format 함수를 호출합니다.
        }
        str = '$formattedIntPart.$truncated';
      }

      // 끝이 0인 경우 제거합니다.
      List<String> newParts = str.split('.');
      String decimalPart = newParts[1];
      while (decimalPart.endsWith('0')) {
        decimalPart = decimalPart.substring(0, decimalPart.length - 1);
      }

      // 모든 숫자가 제거된 경우 소수점 아래 부분을 출력하지 않습니다.
      if (decimalPart.isEmpty) {
        return formattedIntPart;
      }
      return '$formattedIntPart.$decimalPart';
    } else {
      return formattedIntPart;
    }
  }
}