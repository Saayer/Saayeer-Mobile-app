import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saayer/core/utils/colors.dart';

showToast({String msg = "", toastLength}) => Fluttertoast.showToast(
      msg: msg,
      //  toastDuration: Duration(seconds: 2),
      toastLength: toastLength ?? Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: ColorsPalette.blackTextColor,
      textColor: Colors.white,
      fontSize: 16,
    );
