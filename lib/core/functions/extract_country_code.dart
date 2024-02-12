import 'package:intl_phone_field/countries.dart';

List<String> extractCountryCode(String number) {
  Country? foundedCountry;
  for (var country in countries) {
    String dialCode = '+${country.dialCode}';
    if (number.startsWith(dialCode)) {
      foundedCountry = country;
    }
  }

  if (foundedCountry != null) {
    String dialCode = foundedCountry.dialCode;
    String code = foundedCountry.code;
    String phoneNumber = number.substring(dialCode.length + 1);
    return [dialCode, phoneNumber, code];
  }
  return ["", ""];
}
