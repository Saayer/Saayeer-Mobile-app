import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/home_card_item_widget.dart';

class HomeCardsWidget extends StatelessWidget {
  const HomeCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    final Map<String, String> homeCardsMap =
        _getHomeCardsMap(homeBloc.state.clientDto!);
    final List<Color> colors = _getHomeCardsColors();
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (160) / (84),
        mainAxisSpacing: (8 * 2),
        crossAxisSpacing: (8 * 2),
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

  Map<String, String> _getHomeCardsMap(ClientGetDto userProfileEntity) {
    Map<String, String> homeCardsMap = {};
    //homeCardsMap["my_balance"] = "${userProfileEntity.balance} ${"sr".tr()}";
    //homeCardsMap["total_shipments"] = userProfileEntity.totalShipments;
    // homeCardsMap["my_bills"] = userProfileEntity.totalBills;
    // homeCardsMap["total_store_requests"] = userProfileEntity.totalStoreRequests;
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
