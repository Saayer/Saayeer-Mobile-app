import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:saayer/common/generic_svg_widget.dart';
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
  final String description;

  const TrackingTimelineItem({
    super.key,
    required this.label,
    required this.isComplete,
    required this.isFirst,
    required this.isLast,
    required this.createdDate,
    required this.description,
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
          GenericSvgWidget(
            path: Constants.getShipmentStatusIconPath("$label.svg"),
            size: 50,
            color: isComplete
                ? SaayerTheme().getColorsPalette.orangeColor
                : SaayerTheme().getColorsPalette.blackColor.withOpacity(0.2),
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
                      Text(
                        description,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                createdDate.split(' ').sublist(1).join(' '),
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: AppTextStyles.smallLabel(isComplete
                                    ? SaayerTheme().getColorsPalette.blackColor
                                    : SaayerTheme().getColorsPalette.greyColor),
                              ),
                            ),
                            Text(
                              ' ${createdDate.split(' ').first}',
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: AppTextStyles.smallLabel(isComplete
                                  ? SaayerTheme().getColorsPalette.blackColor
                                  : SaayerTheme().getColorsPalette.greyColor),
                            ),
                          ],
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
