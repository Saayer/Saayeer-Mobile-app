import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/widgets/more_card_item_widget.dart';

class MoreCardsWidget extends StatelessWidget {
  const MoreCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> moreCardsStrList = ["my_balance","addresses_book", "shipping_rates"];
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 0.h),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (130).w / (84).h,
        mainAxisSpacing: (8 * 2).h,
        crossAxisSpacing: (8 * 2).w,
      ),
      itemCount: moreCardsStrList.length,
      itemBuilder: (context, index) {
        final String moreCardStr = moreCardsStrList[index];
        return MoreCardItemWidget(
          title: moreCardStr,
          iconName: moreCardStr,
        );
      },
    );
  }
}
