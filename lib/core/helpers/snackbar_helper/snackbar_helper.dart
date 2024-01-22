import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackbarHelper {
  static void show({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        padding: EdgeInsets.only(bottom: 100.h, left: 16.w, right: 16.w),
        content: const Text(""),
        elevation: 0,
        backgroundColor: Colors.transparent));
  }
}
