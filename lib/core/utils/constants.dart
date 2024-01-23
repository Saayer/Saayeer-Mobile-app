import 'package:intl/intl.dart';

class Constants {
  static const String appName = 'wannareach';
  static const String assetImageBasePath = "assets/images/";
  static const String assetIconBasePath = "assets/icons/";
  static const String assetGifBasePath = "assets/gifs/";
  static const String assetLottieBasePath = "assets/lottie/";
  static const String stringsPath = "assets/strings/";

  final String formattedNowDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now());

  static const String loremTxt =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      " Donec interdum metus eu tortor varius, vitae tristique ante vehicula. "
      "Donec consequat felis nec risus finibus, vitae pharetra lacus ultrices. "
      "Praesent ac quam ut ex tempor semper. Morbi fermentum cursus lorem, quis tincidunt eros "
      "luctus ac. Aliquam blandit pharetra pellentesque. Donec justo sapien, auctor "
      "pellentesque eros a, porta sodales metus. Suspendisse imperdiet felis a interdum finibus."
      " Etiam arcu elit, finibus a massa quis, luctus molestie leo. Donec imperdiet "
      "leo at libero euismod, et pulvinar enim accumsan. Proin quis felis et eros pulvinar rutrum. "
      "Cras porttitor urna sed ante egestas, nec vulputate dui vehicula.";

  static const String apiErrorMessageKey = 'status_message';
  static const String fetchDataExceptionMessage = 'Error During Communication';
  static const String badRequestExceptionMessage = 'Bad Request';
  static const String unauthorizedExceptionMessage = 'Unauthorized';
  static const String notFoundExceptionMessage = 'Requested Info Not Found';
  static const String conflictExceptionMessage = 'Conflict Occurred';
  static const String internalExceptionMessage = 'Internal Server Error';
  static const String noInternetExceptionMessage = 'No Internet Connection';

  static String getImagePath(String imageName) =>
      "$assetImageBasePath$imageName";

  static String getIconPath(String imageName) => "$assetIconBasePath$imageName";

  static String getGifPath(String imageName) => "$assetGifBasePath$imageName";

  static String getLottiePath(String imageName) =>
      "$assetLottieBasePath$imageName";
}
