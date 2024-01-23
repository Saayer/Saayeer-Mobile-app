import 'package:easy_localization/easy_localization.dart';

class DateTimeUtil {
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

  static DateTime? toUtcDateTime(String? val, {String? readFormat}) {
    DateTime? result;
    if (val?.isNotEmpty ?? false) {
      try {
        var dateKeyFormat = DateFormat(
            readFormat == null || readFormat.isEmpty
                ? 'dd/MM/yyyy'
                : readFormat,
            "en-US");
        result = dateKeyFormat.parseUTC(val!);
      } catch (e) {
        return null;
      }
    }
    return result!;
  }

  static String dMyString(DateTime? val, {bool localize = true}) {
    String result = "";
    if (val != null) {
      try {
        var dateKeyFormat = DateFormat('dd/MM/yyyy', "en_US");
        result = dateKeyFormat.format(val);
      } catch (e) {}
    }

    return result;
  }
}
