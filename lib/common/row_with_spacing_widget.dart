import 'package:flutter/material.dart';

class RowWithSpacing extends Row {
  RowWithSpacing({
    super.key,
    double spacing = 8,
    bool hasLeadingSpace = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    List<Widget> children = const [],
  }) : super(
          children: [
            ...hasLeadingSpace ? [SizedBox(width: spacing)] : <Widget>[],
            ...children.expand(
              (w) => [
                w,
                SizedBox(width: spacing),
              ],
            )
          ],
        );
}
