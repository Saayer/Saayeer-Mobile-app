import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

class DateTimeUtil {
  ///
  static Duration twentyThreeHoursAndFiftyNineMin = const Duration(hours: 23, minutes: 59);

  ///
  static DateTime? toDateTime(String? val, {String? readFormat}) {
    DateTime? result;
    if (val != null && val.isNotEmpty) {
      try {
        var dateKeyFormat = DateFormat(
          readFormat == null || readFormat.isEmpty ? 'dd/MM/yyyy' : readFormat,
          "en",
        );
        result = dateKeyFormat.parse(val);
      } catch (e) {
        return null;
      }
    }
    return result;
  }

  ///
  static DateTime? toUtcDateTime(String? val, {String? readFormat}) {
    DateTime? result;
    if (val?.isNotEmpty ?? false) {
      try {
        var dateKeyFormat =
            DateFormat(readFormat == null || readFormat.isEmpty ? 'dd/MM/yyyy hh:mm' : readFormat, "en-US");
        result = dateKeyFormat.parseUTC(val!);
      } catch (e) {
        return null;
      }
    }
    return result!;
  }

  ///
  static String dMyString(DateTime? val, {bool localize = true}) {
    String result = "";
    if (val != null) {
      try {
        var dateKeyFormat = DateFormat('dd/MM/yyyy hh:mm', "en_US");
        result = dateKeyFormat.format(val);
      } catch (e) {}
    }

    return result;
  }

  ///
  static DateTime? convertUTCDateToLocalFullFormat(String date) {
    DateTime? localTime;

    ///
    try {
      ///
      var utcDate = DateFormat("yyyy-MM-dd hh:mm").parse(date, true);
      var local = utcDate.toLocal();
      localTime = DateTime.parse(DateFormat("yyyy-MM-dd hh:mm").format(local));
      return localTime;
    } on Exception catch (e) {
      log('Error in DateFormat: $e');
      return localTime;
    }
  }

  ///
  static String? convertUTCDateToLocalWithoutSec(String date) {
    ///
    try {
      ///
      String utcString = date;
      if (!date.endsWith('Z') && date.isNotEmpty) {
        utcString = '${date}Z';
      }
      // Parse the UTC DateTime string
      DateTime utcDateTime = DateTime.parse(utcString);
      // Convert UTC DateTime to local DateTime
      DateTime localDateTime = utcDateTime.toLocal();
      // Format the local DateTime to the desired format
      DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
      String formattedDateTime = formatter.format(localDateTime);

      return formattedDateTime;
    } on Exception catch (e) {
      log('Error in DateFormat: $e');
      return date;
    }
  }

  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  static DateTime? getFirstDayDateOfCurrentMonthUTC() {
    return toUtcDateTime(dMyString(DateTime(DateTime.now().year, DateTime.now().month, 1)));
  }

  static DateTime? getLastDayDateOfCurrentMonthUTC() {
    return toUtcDateTime(dMyString(DateTime(DateTime.now().year, DateTime.now().month + 1, 0)));
  }
}

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime date) {
    // ignore hour,minute,second..
    final dateFormat = DateFormat("yyyy-MM-dd");
    final date1 = dateFormat.format(this);
    final date2 = dateFormat.format(date);
    return date1 == date2;
  }
}
