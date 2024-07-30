import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:validators/validators.dart';

class GenericSvgWidget extends StatelessWidget {
  final String path;
  final String? baseUrl;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? size;

  const GenericSvgWidget(
      {Key? key,
      required this.path,
      this.baseUrl,
      this.onTap,
      this.semanticLabel,
      this.color,
      this.padding,
      this.margin,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
            width: size,
            height: size,
            padding: padding,
            margin: margin,
            child: _getProperSvgWidget()),
      ),
    );
  }

  Widget _getProperSvgWidget() => isURL(_fullPath())
      ? SvgNetworkWidget(
          path: _fullPath(),
          semanticLabel: semanticLabel,
          color: color,
        )
      : SvgAssetWidget(path: path, semanticLabel: semanticLabel, color: color);

  String _fullPath() => StringsUtil.isValidImageUrl((baseUrl ?? "") + path) ?  ((baseUrl ?? "") + path): '';
}

class SvgAssetWidget extends StatelessWidget {
  const SvgAssetWidget({
    Key? key,
    required this.path,
    required this.semanticLabel,
    required this.color,
  }) : super(key: key);

  final String path;
  final String? semanticLabel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      semanticsLabel: semanticLabel,
      color: color,
    );
  }
}

class SvgNetworkWidget extends StatelessWidget {
  const SvgNetworkWidget({
    Key? key,
    required this.path,
    required this.semanticLabel,
    required this.color,
  }) : super(key: key);

  final String path;
  final String? semanticLabel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      path,
      semanticsLabel: semanticLabel,
      color: color,
    );
  }
}
