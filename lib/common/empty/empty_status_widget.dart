import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';

class EmptyStatusWidget extends StatelessWidget {
  final String title, desc, btnLabel, iconName;

  final Widget? iconWidget;
  final TextStyle? titleTextStyle, descTextStyle;
  final double size;
  final double dividerWidth, btnWidth;
  final void Function()? onBtnPressed;
  final bool hasButton;

  const EmptyStatusWidget(
      {super.key,
      required this.title,
      required this.desc,
      required this.btnLabel,
      required this.iconName,
      this.iconWidget,
      this.titleTextStyle,
      this.descTextStyle,
      required this.size,
      this.btnWidth = 1,
      this.dividerWidth = 2,
      this.onBtnPressed,
      this.hasButton = true});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: (size + 5),
                    backgroundColor:
                        SaayerTheme().getColorsPalette.blackTextColor,
                    child: CircleAvatar(
                      radius: size,
                      backgroundColor:
                          SaayerTheme().getColorsPalette.backgroundColor,
                      child: iconWidget ??
                          SvgPicture.asset(
                            Constants.getIconPath("ic_$iconName.svg"),
                            width: size,
                            height: size,
                            color:
                                SaayerTheme().getColorsPalette.blackTextColor,
                          ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 180,
                    child: SizedBox(
                      width: 200,
                      child: Divider(
                        thickness: 5,
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                title,
                style: titleTextStyle ?? AppTextStyles.boldLiteLabel(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                desc,
                style: descTextStyle ?? AppTextStyles.liteLabel(),
                textAlign: TextAlign.center,
              ),
              if (hasButton) ...[
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width / btnWidth,
                  color: SaayerTheme().getColorsPalette.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 50, left: 16, right: 16, top: 20),
                    child: SaayerDefaultTextButton(
                      text: btnLabel,
                      isEnabled: true,
                      borderRadius: 16,
                      onPressed: () {
                        if (onBtnPressed != null) {
                          onBtnPressed!();
                        }
                      },
                      btnWidth: width / 1.2,
                      btnHeight: 50,
                    ),
                  ),
                ),
              ],
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
