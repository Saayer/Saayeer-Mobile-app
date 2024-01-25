import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/common/cached_network_image_widget.dart';

class UserCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const UserCircleAvatar({Key? key, this.radius = 50, this.imageUrl = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("$imageUrl", name: "UserCircleAvatar");
    return CircleAvatar(
        radius: radius,
        backgroundColor: SaayerTheme().getColorsPalette.whiteColor,
        child: CachedNetworkImageWidget(
          imageUrl: imageUrl,
        ));
  }
}
