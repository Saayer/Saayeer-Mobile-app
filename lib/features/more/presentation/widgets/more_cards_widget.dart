import 'package:flutter/material.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/screens/personal_info_screen.dart';
import 'package:saayer/features/more/presentation/widgets/more_card_item_widget.dart';

class MoreCardsWidget extends StatelessWidget {
  const MoreCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> moreCardsStrMap = {
      "profile": const PersonalInfoScreen(),
      //"reports": const ReportsScreen(),
    };
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: largerThanTablet(context) ? 5 : 3,
        mainAxisSpacing: (8 * 2),
        crossAxisSpacing: (8 * 2),
      ),
      itemCount: moreCardsStrMap.entries.toList().length,
      itemBuilder: (context, index) {
        final String moreCardStr = moreCardsStrMap.keys.toList()[index];
        final Widget moreCardOnPressedWidget =
            moreCardsStrMap.values.toList()[index];
        return MoreCardItemWidget(
          title: moreCardStr,
          iconName: moreCardStr,
          onPressedWidget: moreCardOnPressedWidget,
        );
      },
    );
  }
}
