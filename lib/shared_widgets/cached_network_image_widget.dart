import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/utils/app_strings.dart';
import 'package:saayer/core/utils/colors.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  final String imageUrl;
  final String? placeHolderPath;
  final double? width, height;

  const CachedNetworkImageWidget(
      {Key? key,
      required this.imageUrl,
      this.width = 80,
      this.height = 152,
      this.placeHolderPath})
      : super(key: key);

  @override
  State<CachedNetworkImageWidget> createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Widget placeHolderImage = Image.asset(
      widget.placeHolderPath ?? AppStrings.getSVGIconPath("Asset 30.png"),
      height: 47,
      width: 47,
      fit: BoxFit.contain,
    );
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      height: widget.height,
      width: widget.width,
      fit: BoxFit.contain,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return downloadProgress.progress != null
            ? Center(
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: ColorsPalette.primaryColor)),
              )
            : placeHolderImage;
      },
      errorWidget: (context, url, error) => placeHolderImage,
    );
  }
}
