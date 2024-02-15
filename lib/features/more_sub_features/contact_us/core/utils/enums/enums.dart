import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum ContactUsTypes {
  WHATSAPP._(
      title: "whats_app",
      description: "00009789",
      iconData: LineIcons.whatSApp),
  HOTLINE._(title: "hotline", description: "0600", iconData: LineIcons.phoneVolume),
  FACEBOOK._(
      title: "facebook", description: "saayer", iconData: LineIcons.facebookSquare),
  INSTAGRAM._(
      title: "instagram", description: "saayer", iconData: LineIcons.instagram),
  WEBSITE._(title: "website", description: "saayer", iconData: Icons.language);

  final String title, description;
  final IconData iconData;

  const ContactUsTypes._(
      {required this.title, required this.description, required this.iconData});
}
