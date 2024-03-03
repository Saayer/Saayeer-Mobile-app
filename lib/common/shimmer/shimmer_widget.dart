import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double widgetHeight;
  final Widget child;

  const ShimmerWidget(
      {super.key, this.widgetHeight = 100, required this.child});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: widgetHeight.h,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  10,
                  (index) => Column(
                        children: [
                          Container(
                            height: 30.h,
                            width: width,
                            decoration: BoxDecoration(
                              color: SaayerTheme().getColorsPalette.greyColor,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          )
                        ],
                      )),
            ),
          )),
    );
  }
}
