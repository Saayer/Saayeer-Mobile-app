import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:validators/validators.dart';

class ValidationUtils {
  static bool isValidMobile(String mobile) {
    return (mobile.isNotEmpty &&
        mobile.trim()[0] == '0' &&
        mobile.length == 11);
  }

  static bool isIBANMobile(String iban) {
    return (iban.isNotEmpty &&
        iban.trim().startsWith('EG') &&
        iban.length == 29);
  }

  static bool isValidRegisteredMobile(String mobile) {
    return (mobile.isNotEmpty &&
        mobile.startsWith('01') &&
        mobile.length == 11);
  }

  static bool isValidLocalMobile(String mobile) {
    return (mobile.trim().length == 11 &&
        mobile.trim()[0] == '0' &&
        mobile.trim()[1] == '1');
  }

  static bool isValidImageURL(String url) {
    if (url.toLowerCase().contains("jpg") ||
        url.toLowerCase().contains("jpeg") ||
        url.toLowerCase().contains("png")) {
      return true;
    }
    return false;
  }

  static bool isValidEmail(String email) {
    return isEmail(email);
  }

  static bool isValidIDNumber(String idNumber) {
    String dateOfBirth = "";
    if (idNumber.trim().length == 14) {
      dateOfBirth = StringsUtil.getDateOfBirthFromID(idNumber);
      if (isValidateDate(dateOfBirth)) return true;
    }

    return false;
  }

  static bool isValidateDate(String date) {
    return DateTimeUtil.toDateTime(date) != null; //isDate(date);
  }

  static bool isValidText(String text) {
    if (text.trim().isNotEmpty) return true;
    return false;
  }

  static bool isValidNumberOfChildren(String text) {
    if (text.trim().isNotEmpty) return true;

    return false;
  }

  static bool isValidNames(String text) {
    return (text.trim().length >= 2);
  }

  static bool isValidHomePhone(String homePhone) {
    if (isNumeric(homePhone) &&
        homePhone.trim()[0] == '0' &&
        homePhone.trim().length >= 8 &&
        homePhone.trim().length <= 15) return true;

    return false;
  }

  static bool isValidPaiedAmount(
      double enteredPaiedAmount, double totalDueWithFee) {
    if (enteredPaiedAmount >= totalDueWithFee) return true;

    return false;
  }

  static bool isValidPassword(String password) {
    if (password.length < 8 ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])'
                r'(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$')
            .hasMatch(password.toString())) {
      return false;
    }
    return true;
  }
}
