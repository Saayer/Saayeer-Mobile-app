import 'package:intl/intl.dart';

class Constants {
  static const String appName = 'Saayer';
  static const String assetImageBasePath = "assets/images/";
  static const String assetIconBasePath = "assets/icons/";
  static const String assetGifBasePath = "assets/gifs/";
  static const String assetLottieBasePath = "assets/lottie/";
  static const String stringsPath = "assets/strings";
  static const String imagesBaseUrl = "/images/logistics-services/{}.jpg";
  static const String saayerPhone = "+966552061645";
  static const String saayerFacebookUrl = "https://www.facebook.com/profile.php?id=61556770131235&mibextid=LQQJ4d";
  static const String saayerInstagramUrl = "https://www.instagram.com/_saayer_";
  static const String saayerTiktokUrl = "https://www.tiktok.com/@.saayer";
  static const String saayerWebsiteUrl = "https://saayer.com/";
  static const String saayerTwitterUrl = "https://x.com/_saayer";
  static const String defaultUserName = "Saayer Client";

  static final String formattedNowDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now());

  static String getImagePath(String imageName) =>
      "$assetImageBasePath$imageName";

  static String getIconPath(String imageName) => "$assetIconBasePath$imageName";

  static String getGifPath(String imageName) => "$assetGifBasePath$imageName";

  static String getLottiePath(String imageName) =>
      "$assetLottieBasePath$imageName";
}
