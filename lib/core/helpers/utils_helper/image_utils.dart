import 'dart:convert';
import 'package:universal_io/io.dart';

class ImageUtils {
  static String? convert2Base64(File bitmap) {
    try {
      List<int> imageBytes = bitmap.readAsBytesSync();
      return base64Encode(imageBytes);
    } catch (e) {
      return null;
    }
  }
}
