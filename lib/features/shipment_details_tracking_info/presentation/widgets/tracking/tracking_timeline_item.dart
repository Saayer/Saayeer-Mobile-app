import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingTimelineItem extends StatelessWidget {
  final bool isComplete;
  final String label;
  final bool isFirst;
  final bool isLast;
  final String createdDate;

  const TrackingTimelineItem({
    super.key,
    required this.label,
    required this.isComplete,
    required this.isFirst,
    required this.isLast,
    required this.createdDate,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isComplete ? SaayerTheme().getColorsPalette.primaryColor : SaayerTheme().getColorsPalette.greyColor,
      ),
      beforeLineStyle: LineStyle(
        color: isComplete ? SaayerTheme().getColorsPalette.primaryColor : SaayerTheme().getColorsPalette.greyColor,
        thickness: 6,
      ),
      afterLineStyle: LineStyle(
        color: isComplete ? SaayerTheme().getColorsPalette.primaryColor : SaayerTheme().getColorsPalette.greyColor,
        thickness: 6,
      ),
      startChild: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorFiltered(
            colorFilter: isComplete
                ? const ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.color,
                  )
                : ColorFilter.mode(
                    SaayerTheme().getColorsPalette.greyColor.withOpacity(0.5),
                    BlendMode.modulate,
                  ),
            child: Lottie.asset(
              height: 50,
              Constants.getLottiePath("${label}_shipment.json"),
            ),
          ),
        ],
      ),
      endChild: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          (!isComplete)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    label.tr(),
                    style: AppTextStyles.boldLabel(isComplete
                        ? SaayerTheme().getColorsPalette.blackColor
                        : SaayerTheme().getColorsPalette.greyColor),
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        label.tr(),
                        style: AppTextStyles.boldLabel(isComplete
                            ? SaayerTheme().getColorsPalette.blackColor
                            : SaayerTheme().getColorsPalette.greyColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${label}_msg'.tr(),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: AppTextStyles.smallLabel(isComplete
                            ? SaayerTheme().getColorsPalette.blackColor
                            : SaayerTheme().getColorsPalette.greyColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (isComplete)
                        Text(
                          createdDate,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          style: AppTextStyles.smallLabel(isComplete
                              ? SaayerTheme().getColorsPalette.blackColor
                              : SaayerTheme().getColorsPalette.greyColor),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
