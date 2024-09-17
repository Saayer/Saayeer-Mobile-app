import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class LunchUrlService {

  static Future<bool> lunchGenericUrl(String url, {LaunchMode? mode}) async {
    try {
      final genericUrl = url;
      final url0 = Uri.parse(genericUrl);
      return await launchUrl(url0,
          mode: mode ?? LaunchMode.externalApplication);
    } on Exception catch (e) {
      log("LunchUrlService: $e");
      return false;
    }
  }
}
