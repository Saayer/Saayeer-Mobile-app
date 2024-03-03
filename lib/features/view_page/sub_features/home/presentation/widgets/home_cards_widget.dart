import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/sub_features/home/domain/entities/user_profile_entity.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/widgets/home_card_item_widget.dart';

class HomeCardsWidget extends StatelessWidget {
  const HomeCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    final Map<String, String> homeCardsMap =
        _getHomeCardsMap(homeBloc.state.userProfileEntity!);
    final List<Color> colors = _getHomeCardsColors();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 0.h),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (160).w / (84).h,
        mainAxisSpacing: (8 * 2).h,
        crossAxisSpacing: (8 * 2).w,
      ),
      itemCount: homeCardsMap.entries.toList().length,
      itemBuilder: (context, index) {
        final MapEntry<String, String> homeCardsMapEntry =
            homeCardsMap.entries.toList()[index];
        return HomeCardItemWidget(
          label: homeCardsMapEntry.value,
          title: homeCardsMapEntry.key,
          iconName: homeCardsMapEntry.key,
          color: colors[index],
        );
      },
    );
  }

  Map<String, String> _getHomeCardsMap(UserProfileEntity userProfileEntity) {
    Map<String, String> homeCardsMap = {};
    homeCardsMap["my_balance"] = userProfileEntity.balance;
    homeCardsMap["total_shipments"] = userProfileEntity.totalShipments;
    homeCardsMap["my_bills"] = userProfileEntity.totalBills;
    homeCardsMap["total_store_requests"] = userProfileEntity.totalStoreRequests;
    return homeCardsMap;
  }

  List<Color> _getHomeCardsColors() {
    return [
      Colors.teal,
      Colors.indigo,
      Colors.blueAccent,
      Colors.cyan,
    ];
  }
}
