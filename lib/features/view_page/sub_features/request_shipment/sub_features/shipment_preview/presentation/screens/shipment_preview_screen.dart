import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class ShipmentPreviewScreen extends StatefulWidget {
  const ShipmentPreviewScreen({super.key});

  @override
  State<ShipmentPreviewScreen> createState() => _ShipmentPreviewScreenState();
}

class _ShipmentPreviewScreenState extends State<ShipmentPreviewScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    offset = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            SlideTransition(
              position: offset,
              child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: width / 1.1,
                        decoration: BoxDecoration(
                          color: SaayerTheme().getColorsPalette.greyColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            // BillHeaderWidget(),



                            Container(
                              height: 46.r,
                              child: OverflowBox(
                                minWidth: 1.sw - 32.w,
                                maxWidth: 1.sw - 32.w,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: -23.r,
                                      child: Container(
                                        height: 46.r,
                                        width: 46.r,
                                        decoration: BoxDecoration(
                                          color: SaayerTheme()
                                              .getColorsPalette
                                              .accentColor,
                                          borderRadius:
                                              BorderRadius.circular(23.r),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -23.r,
                                      child: Container(
                                        height: 46.r,
                                        width: 46.r,
                                        decoration: BoxDecoration(
                                          color: SaayerTheme()
                                              .getColorsPalette
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(23.r),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        left: 23.r,
                                        right: 23.r,
                                        top: 21.r,
                                        bottom: 21.r,
                                        child: DottedLine(
                                          direction: Axis.horizontal,
                                          alignment: WrapAlignment.center,
                                          lineLength: double.infinity,
                                          lineThickness: 2.r,
                                          dashLength: 6.r,
                                          dashColor: SaayerTheme()
                                              .getColorsPalette
                                              .primaryColor,
                                          dashGapLength: 4.r,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            // ReviewBillRequestWidget(),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 14,
            ),
            // _addToQuickPay(billPaymenState),
            SizedBox(
              height: 24,
            ),
            // _actionButton(),
            SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
