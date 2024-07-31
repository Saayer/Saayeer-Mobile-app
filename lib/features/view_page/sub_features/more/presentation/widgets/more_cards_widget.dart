import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/features/address/addresses_book/presentation/screens/addresses_book_screen.dart';
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/screens/shipping_rates_screen.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/widgets/more_card_item_widget.dart';

class MoreCardsWidget extends StatelessWidget {
  const MoreCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> moreCardsStrMap = {
      "addresses_book": const AddressesBookScreen(),
      "shipping_rates": const ShippingRatesScreen()
    };
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 0.h),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (170).w / (84).h,
        mainAxisSpacing: (8 * 2).h,
        crossAxisSpacing: (8 * 2).w,
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
