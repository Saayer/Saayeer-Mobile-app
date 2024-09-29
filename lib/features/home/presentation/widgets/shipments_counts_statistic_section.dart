import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/features/home/core/errors/home_error_handler.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/new_shipment_card_item_widget.dart';
import 'package:saayer/features/home/presentation/widgets/shipments_statistic_item_widget.dart';
import 'package:saayer/features/request_new_shipment/presentation/screens/request_new_shipment_screen.dart';

class ShipmentsCountsStatisticSection extends StatelessWidget {
  const ShipmentsCountsStatisticSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    bool isLoading = false;
    bool hasError = false;
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previousState, nextState) =>
          (previousState.shipmentsCountStateHelper.requestState != nextState.shipmentsCountStateHelper.requestState),
      listener: (context, state) {
        isLoading = (state.shipmentsCountStateHelper.requestState == HomeRequestState.LOADING_SHIPMENTS_COUNT);
        if (!isLoading) {
          if (state.shipmentsCountStateHelper.requestState == HomeRequestState.LOADED_SHIPMENTS_COUNT) {}
          if (state.shipmentsCountStateHelper.requestState == HomeRequestState.SUCCESS_SHIPMENTS_COUNT) {}
          if (state.shipmentsCountStateHelper.requestState == HomeRequestState.ERROR_SHIPMENTS_COUNT) {
            hasError = true;
            HomeErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return (isLoading || homeBloc.shipmentsCountResponse == null)
            ? const GridShimmerWidget()
            : hasError
                ? const NewShipmentCardItemWidget()
                : GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: largerThanTablet(context) ? 3.5 : 1.8,
                      mainAxisSpacing: (8 * 2),
                      crossAxisSpacing: (8 * 2),
                    ),
                    itemCount: ShipmentsStatisticsTypes.values.length,
                    itemBuilder: (context, index) {
                      return ShipmentsStatisticItemWidget(
                        onTap: index == 0
                            ? () {
                                getIt<NavigationService>().navigateTo(const RequestNewShipmentScreen());
                              }
                            : null,
                        animatedIcon: index == 0 ? false : true,
                        title: ShipmentsStatisticsTypes.values[index].name,
                        shipmentsNum: _getTotalShipmentsCount(
                            ShipmentsStatisticsTypes.values[index], homeBloc.shipmentsCountResponse),
                      );
                    },
                  );
      },
    );
  }

  _getTotalShipmentsCount(
      ShipmentsStatisticsTypes shipmentsStatusType, ShipmentsCountResponse? shipmentsCountResponse) {
    switch (shipmentsStatusType) {
      case ShipmentsStatisticsTypes.NEW_SHIPMENT:
        {
          return 'request'.tr();
        }
      case ShipmentsStatisticsTypes.SHIPMENTS:
        {
          return shipmentsCountResponse!.totalShipments.toString();
        }
      case ShipmentsStatisticsTypes.REQUESTED:
        {
          return shipmentsCountResponse!.requestedShipments.toString();
        }
      case ShipmentsStatisticsTypes.PICKED:
        {
          return shipmentsCountResponse!.pickedShipments.toString();
        }
      case ShipmentsStatisticsTypes.SHIPPING:
        {
          return shipmentsCountResponse!.onTheWayShipments.toString();
        }
      case ShipmentsStatisticsTypes.DELIVERED:
        {
          return shipmentsCountResponse!.deliveredShipments.toString();
        }
    }
  }
}
