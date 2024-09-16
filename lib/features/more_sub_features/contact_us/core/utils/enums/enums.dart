import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum ContactUsTypes {
  WHATSAPP._(title: "whats_app", description: "00009789", clickable: false, url: '', iconData: LineIcons.whatSApp),
  HOTLINE._(title: "hotline", description: "0600", clickable: false, url: '', iconData: LineIcons.phoneVolume),
  FACEBOOK._(
      title: "facebook",
      description: "saayer",
      clickable: true,
      url: 'https://www.facebook.com/profile.php?id=61556770131235&mibextid=LQQJ4d',
      iconData: LineIcons.facebookSquare),
  TWITTER._(
      title: "twitter", description: "saayer", clickable: true, url: 'https://x.com/_saayer', iconData: LineIcons.twitter),
  INSTAGRAM._(
      title: "instagram",
      description: "saayer",
      clickable: true,
      url: 'https://www.instagram.com/_saayer_',
      iconData: LineIcons.instagram),
  TIKTOK._(
      title: "tiktok",
      description: "saayer",
      clickable: true,
      url: 'https://www.tiktok.com/@.saayer',
      iconData: Icons.tiktok),
  WEBSITE._(title: "website", description: "saayer", clickable: true, url: 'https://saayer.com/', iconData: Icons.language);

  final String title, description, url;
  final IconData iconData;
  final bool clickable;

  const ContactUsTypes._({
    required this.title,
    required this.description,
    required this.iconData,
    required this.clickable,
    required this.url,
  });
}
