import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  final String imageUrl;
  final String? placeHolderPath;
  final double? width, height;

  const CachedNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.placeHolderPath});

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
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Widget placeHolderImage = widget.placeHolderPath != null
        ? Image.asset(
            widget.placeHolderPath!,
            height: 47.h,
            width: 47.w,
            fit: BoxFit.contain,
          )
        : SizedBox(
            height: 47.h,
            width: 47.w,
          );
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      height: widget.height ?? 152.h,
      width: widget.width ?? 80.w,
      fit: BoxFit.contain,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return downloadProgress.progress != null
            ? Center(
                child: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: SaayerTheme().getColorsPalette.primaryColor)),
              )
            : placeHolderImage;
      },
      errorWidget: (context, url, error) => placeHolderImage,
    );
  }
}
