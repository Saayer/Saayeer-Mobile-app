import 'package:flutter/material.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double widgetHeight;

  const ShimmerWidget({super.key, this.widgetHeight = 100});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: widgetHeight,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  10,
                  (index) => Column(
                        children: [
                          Container(
                            height: 70,
                            width: width,
                            decoration: BoxDecoration(
                              color: SaayerTheme().getColorsPalette.greyColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      )),
            ),
          )),
    );
  }
}
