import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/core/utils/constants/constants.dart';

enum ContactUsTypes {
  WHATSAPP._(
    title: "whats_app",
    description: Constants.saayerPhone,
    clickable: true,
    url: '',
    iconData: LineIcons.whatSApp,
  ),
  HOTLINE._(
    title: "hotline",
    description: Constants.saayerPhone,
    clickable: true,
    url: '',
    iconData: LineIcons.phoneVolume,
  ),
  FACEBOOK._(
      title: "facebook",
      description: "saayer",
      clickable: true,
      url: Constants.saayerFacebookUrl,
      iconData: LineIcons.facebookSquare),
  TWITTER._(
      title: "twitter",
      description: "saayer",
      clickable: true,
      url: Constants.saayerTwitterUrl,
      iconData: LineIcons.twitter),
  INSTAGRAM._(
      title: "instagram",
      description: "saayer",
      clickable: true,
      url: Constants.saayerInstagramUrl,
      iconData: LineIcons.instagram),
  TIKTOK._(
    title: "tiktok",
    description: "saayer",
    clickable: true,
    url: Constants.saayerTiktokUrl,
    iconData: Icons.tiktok,
  ),
  WEBSITE._(
      title: "website",
      description: "saayer",
      clickable: true,
      url: Constants.saayerWebsiteUrl,
      iconData: Icons.language);

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
