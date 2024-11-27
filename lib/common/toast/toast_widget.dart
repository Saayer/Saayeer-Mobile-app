import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class SaayerToast {
  _showBaseToast(
          {String msg = "", Toast? toastLength, Color? backgroundColor}) =>
      Fluttertoast.showToast(
        msg: msg,
        //  toastDuration: Duration(seconds: 2),
        toastLength: toastLength ?? Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor:
            backgroundColor ?? SaayerTheme().getColorsPalette.blackTextColor,
        textColor: Colors.white,
        fontSize: 16,
      );

  showSuccessToast({String msg = "", Toast? toastLength}) =>
      _showBaseToast(msg: msg, toastLength: toastLength);

  showErrorToast({String msg = "", Toast? toastLength}) =>
      _showBaseToast(msg: msg, toastLength: toastLength);
}
