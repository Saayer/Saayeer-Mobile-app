import 'package:flutter/material.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
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

class GridShimmerWidget extends StatelessWidget {
  final double widgetHeight;
  final int itemCount;

  const GridShimmerWidget({super.key, this.widgetHeight = 100, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: largerThanTablet(context) ? 3.5 : 1.8,
                mainAxisSpacing: (8 * 2),
                crossAxisSpacing: (8 * 2),
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                      color: SaayerTheme().getColorsPalette.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    )
                );
              },
            ),
          )),
    );
  }
}