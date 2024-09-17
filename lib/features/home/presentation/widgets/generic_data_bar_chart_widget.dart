import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class GenericDataBarChartWidget extends StatelessWidget {
  final String title;
  final String yAxisTitle;
  final String total;
  final EdgeInsetsGeometry? margin;
  final double plotHeight;
  final List<String> xAxisDataTitles;
  final bool? showHorizontalLine;

  const GenericDataBarChartWidget({
    super.key,
    required this.title,
    required this.yAxisTitle,
    required this.total,
    this.margin,
    this.plotHeight = 150,
    this.xAxisDataTitles = const [],
    this.showHorizontalLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(spreadRadius: 2, blurRadius: 5, color: SaayerTheme().getColorsPalette.blackColor.withOpacity(.07))
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

            ///TitleAndSubtitleWidget
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    maxLines: 1, style: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.primaryColor)),
                Text(total,
                    maxLines: 1, style: AppTextStyles.mainFocusedLabel()),
              ],
            ),
          ),

          ///PlotWidget
          Container(
            height: plotHeight,
            margin: const EdgeInsets.symmetric(vertical: 35).copyWith(left: 8, right: 25),
            child: BarChart(BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: barGroups,
              gridData: FlGridData(
                drawHorizontalLine: showHorizontalLine ?? false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: SaayerTheme().getColorsPalette.greyColor,
                    strokeWidth: .5,
                  );
                },
                drawVerticalLine: false,
              ),
              alignment: BarChartAlignment.spaceAround,
            ),),
          )
        ],
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.toString(),
              const TextStyle(fontSize: 0),
              children: <TextSpan>[
                TextSpan(
                  text: '${rod.toY}',
                  style: TextStyle(
                    color: Colors.white, //widget.touchedBarColor,
                    fontSize: 16,height: 1.5,
                    backgroundColor: SaayerTheme().getColorsPalette.blackColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,

        ///xAxisDataTitles
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              ///Considering that this axis is for the days,
              /// so that the days are represented correctly
              /// with interval = 1
              interval: 10,
              getTitlesWidget: _titleWidgetsBuilder),
        ),

        ///yAxisData
        leftTitles: AxisTitles(
          sideTitles: SideTitles(

              ///Side space value from the left
              reservedSize: 30,
              showTitles: true,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Center(
                      child: AutoSizeText(
                        value.toInt().toString(),
                        maxLines: 1,
                        minFontSize: 7,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.smallBoldLabel(SaayerTheme().getColorsPalette.greyColor),
                      ),
                    ),
                  )),
          axisNameWidget: Text(
            yAxisTitle,
            style: AppTextStyles.liteLabel(SaayerTheme().getColorsPalette.greyColor),
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget _titleWidgetsBuilder(double value, TitleMeta meta) {
    ///xAxis:
    ///As for the horizontal axis, Data is the same indexes,
    ///as it is used as a gradual to draw the horizontal scheme
    ///yAxis:
    /// As for the vertical axis,
    ///Data is the actual value that we want to draw from somewhere.
    final int requiredIndex = value.toInt();
    String finalText = requiredIndex.toString();

    ///
    if (xAxisDataTitles.isNotEmpty) {
      finalText = GlobalProcedures.safeGetElementFromList<String>(xAxisDataTitles, requiredIndex) ?? "";
    }

    ///
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Center(
        child: AutoSizeText(
          finalText,
          maxLines: 1,
          minFontSize: 7,
          textAlign: TextAlign.center,
          style: AppTextStyles.smallBoldLabel(SaayerTheme().getColorsPalette.greyColor),
        ),
      ),
    );
  }

  List<BarChartGroupData> get barGroups => [
        ...List.generate(
            30,
            (index) => BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: Random().nextInt(20).toDouble(),
                      color: SaayerTheme().getColorsPalette.primaryColor,
                    )
                  ],
                  //showingTooltipIndicators: [0],
                )),
      ];
}
