import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:saayer/core/services/localization/localization.dart';

class StringsUtil {
  static String numToString(String num) {
    return num;
  }

  static String formatTwoDigits(int? n) {
    return n == null ? '00' : n.toString().padLeft(2, '0');
  }

  static bool equalsIgnoreCase(String? a, String? b) {
    return (a == null && b == null) ||
        (a != null && b != null && a.toLowerCase() == b.toLowerCase());
  }

  static String formatAmount(double? number, {int? decimalPlaces}) {
    decimalPlaces ??= 0;
    if (number == null) return "";
    var formatter = NumberFormat(
        "#,##0${decimalPlaces > 0 ? ".${List.filled(decimalPlaces, "0").join()}" : ""}",
        "en_US");

    return numToString(formatter.format(number));
  }

  static final RegExp _upperCaseLetters = RegExp(r'^[A-Z]+$');

  static bool isUpperCaseChar(String? char) {
    return char != null && char.length == 1 && _upperCaseLetters.hasMatch(char);
  }

  static String formatCurrency(double? amount, {int? decimalPlaces}) {
    return amount == null
        ? ''
        : '${formatAmount(amount, decimalPlaces: decimalPlaces ?? 0)} EGP';
  }

  static String formatDownpayment(double? number) {
    if (number == null) return "";
    var formatter = NumberFormat("###0", "en_US");
    return formatter.format(number);
  }

  static final RegExp _lowerCaseLetters = RegExp(r'^[a-z]+$');

  static bool isLowerCaseChar(String? char) {
    return char != null && char.length == 1 && _lowerCaseLetters.hasMatch(char);
  }

  // static bool isDigit(String? char) {
  //   return char != null && char.length == 1 && isNumeric(char);
  // }

  static int? findMaxChar(String? word) {
    int? result = -1;
    if (word != null && word != "") {
      Map<String, int> charsCount = {};

      for (int i = word.length - 1; i >= 0; i--) {
        var ch = word[i].toLowerCase();
        charsCount[ch] = charsCount[ch] == null ? 1 : charsCount[ch]! + 1;
        if (charsCount[ch]! >= result!) {
          result = charsCount[ch];
        }
      }
    }

    return result;
  }

  static String getDateOfBirthFromID(String? idNumber) {
    if (idNumber != null && idNumber.trim().length == 14) {
      String mDataOfBirth = "";
      String millennium = idNumber[0];
      String dateOfBirth = idNumber.substring(1, 7);
      String year = dateOfBirth.substring(0, 2);
      String month = dateOfBirth.substring(2, 4);
      String day = dateOfBirth.substring(4);
      if (millennium == '2') {
        mDataOfBirth = "$day/$month/19$year";
      } else if (millennium == '3') {
        mDataOfBirth = "$day/$month/20$year";
      }
      return mDataOfBirth;
    }
    return "";
  }

  static String getResizedImage(String? url, int width, {int? height}) {
    RegExp exp = RegExp(r"[\S]+[.](png|gif|jpg|jpeg)");
    if (url != null && url.isNotEmpty && exp.hasMatch(url)) {
      var l = "$url?w=$width&nu";
      if (height != null && height > 0) l += '&h=$height';
      return l;
    }
    return '';
  }

  static bool isValidImageUrl(String? url) {
    RegExp exp = RegExp(r"[\S]+[.](png|gif|jpg|jpeg)");
    var r = (url != null && url.isNotEmpty && exp.hasMatch(url));
    return r;
  }

  static String formatCurrencyToDouble(String val) =>
      formatCurrency(double.parse(val)).split(" ")[0].replaceAll(",", ".");

  static String getLanguageName({required String arName, required String enName}) {
    if(Localization.isArabic()){
      return arName;
    }else {
      return enName;
    }
  }
}

extension ListsExtraFunctionalities on List {
  void putIfAbsent<T>(T item) {
    try {
      ///Fill the final list
      final _finalList = this as List<T>;

      ///Check if list item is already exist
      final _existenceIndex = _finalList.indexOf(item);
      if (_existenceIndex > -1) {
        ///Update existed item in the linked list
        _finalList[_existenceIndex] = item;
      } else {
        ///Add this item to the list
        _finalList.add(item);
      }

      ///

      return;
    } on Exception catch (e) {
      log(e.toString(),name: "General usage ext");
      return;
    }
  }

  void putIfAbsentAndRemoveIfExist<T>(T item) {
    try {
      ///Fill the final list
      final _finalList = this as List<T>;

      ///Check if list item is already exist
      final _existenceIndex = _finalList.indexOf(item);
      if (_existenceIndex > -1) {
        ///Remove existed item in the linked list
        _finalList.removeAt(_existenceIndex);
      } else {
        ///Add this item to the list
        _finalList.add(item);
      }

      ///

      return;
    } on Exception catch (e) {
      log(e.toString(),name: "General usage ext");
      return;
    }
  }

  void putIfAbsentAndRemoveIfExistConditioned<T>(T item,
      {required bool Function(T item) condition}) {
    try {
      ///Fill the final list
      final _finalList = this as List<T>;

      ///Check if list item is already exist
      final _existenceIndex = _finalList.indexWhere(condition);
      if (_existenceIndex > -1) {
        ///Remove existed item in the linked list
        _finalList.removeAt(_existenceIndex);
      } else {
        ///Add this item to the list
        _finalList.add(item);
      }

      ///

      return;
    } on Exception catch (e) {
      log(e.toString(),name: "General usage ext");
      return;
    }
  }

  String get concatenatingListOfStrings {
    final originList = this;
    final requiredList = <String>[""];
    if (originList is List<String> && originList.isNotEmpty) {
      requiredList.addAll(originList);
    }

    return requiredList.join(" ");
  }

  String get concatenatingListOfStringsWithoutSpace {
    final originList = this;
    final requiredList = <String>[""];
    if (originList is List<String> && originList.isNotEmpty) {
      requiredList.addAll(originList);
    }

    return requiredList.join("");
  }
}

class GlobalProcedures{
  static T? safeGetElementFromList<T>(List<T> elements, int index) {
    T? element;
    try {
      final isValidIndex = elements.asMap().containsKey(index);
      if (isValidIndex) {
        element = elements.elementAt(index);
      }
    } on Exception catch (e) {
      log("Get element from list: ${e.toString()}");
    }
    return element;
  }
}
