// import 'dart:developer';
//
// import 'package:injectable/injectable.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:saayer/core/entities/sharing_entity.dart';
// import 'package:saayer/core/services/current_user/logged_in_checker_service.dart';
// import 'package:saayer/core/services/deep_link/deep_link.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:saayer/core/services/injection/injection.dart';
// import 'package:saayer/core/services/navigation/navigation_service.dart';
// import 'package:saayer/features/circle/circles/domain/entities/circle_entity.dart';
// import 'package:saayer/features/circle/view_circle_details/presentation/pages/view_circle_details_screen.dart';
// import 'package:saayer/features/view_page/presentation/pages/view_page_screen.dart';
//
// @lazySingleton
// class FirebaseDeepLink extends DeepLink {
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//
//   Future<void> onDeepLink() async {
//     //await Future.delayed(Duration(seconds: 3));
//     var data = await FirebaseDynamicLinks.instance.getInitialLink();
//     var deepLink = data?.link;
//     if (deepLink != null) {
//       log("$deepLink", name: "initDynamicLink1");
//       handleMyLink(deepLink);
//     } else {}
//   }
//
//   Future<void> onDynamicLink() async {
//     dynamicLinks.onLink.listen((dynamicLinkData) {
//       final Uri? deepLink = dynamicLinkData.link;
//       log("$deepLink", name: "initDynamicLink2");
//       if (deepLink != null) {
//         handleMyLink(deepLink);
//       }
//     }).onError((error) {
//       log(error.message, name: 'onLink error');
//     });
//   }
//
//   Future<void> handleMyLink(Uri url) async {
//     List<String> sepeatedLink = [];
//     sepeatedLink.addAll(url.path.split('/'));
//     log("$url", name: "sepeatedLink");
//     log("The Token that i'm interesed in is ${sepeatedLink[1]}",
//         name: "handleMyLink");
//     bool isLoggedIn = await getIt<LoggedInCheckerService>().isLoggedIn();
//     switch (sepeatedLink[1]) {
//       case "circles":
//         if (isLoggedIn) {
//           getIt<NavigationService>().navigateTo(ViewCircleDetailsScreen(
//             circleEntity: CircleEntity(
//                 id: int.tryParse(sepeatedLink[2]) ?? -1,
//                 isMyCircle: false,
//                 userTypeName: "Invited"),
//             memberId: '',
//             selectedSpaceId: sepeatedLink[3] ?? "",
//           ));
//         }
//         break;
//       // default:
//       //   getIt<NavigationService>().navigateAndFinish(ViewPageScreen());
//       //   break;
//     }
//   }
//
//   buildDynamicLinks(SharingEntity sharingEntity) async {
//     String url = "https://wannareach.page.link";
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: url,
//       link: Uri.parse('$url/${sharingEntity.screenName}'),
//       androidParameters: const AndroidParameters(
//         packageName: "com.wannareach.wannareach",
//         minimumVersion: 0,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: 'com.wannareach.wannareach',
//         minimumVersion: '0',
//       ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//           description: sharingEntity.description,
//           imageUrl: Uri.parse("${sharingEntity.imageUrl}"),
//           title: sharingEntity.title),
//     );
//
//     final ShortDynamicLink dynamicUrl =
//         await dynamicLinks.buildShortLink(parameters);
//     log(dynamicUrl.previewLink.toString(), name: "dynamicUrl");
//
//     String? shortUrl = '${dynamicUrl.shortUrl.toString()}';
//
//     await Share.share(shortUrl,
//         subject: "${sharingEntity.title}\n${sharingEntity.description}");
//   }
// }
