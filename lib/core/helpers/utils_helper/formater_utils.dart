import 'dart:convert';
import 'package:universal_io/io.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final List<TextInputFormatter> phoneTextInputFormatters = [
  FilteringTextInputFormatter.digitsOnly
];

final List<TextInputFormatter> localPhoneTextInputFormatters = [
  LengthLimitingTextInputFormatter(11),
  FilteringTextInputFormatter.digitsOnly
];

final List<TextInputFormatter> passwordTextInputFormatters = [
  LengthLimitingTextInputFormatter(30),
  FilteringTextInputFormatter.deny(RegExp('[\\ ]'))
];

final List<TextInputFormatter> lettersOnltTextInputFormatters = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
];





