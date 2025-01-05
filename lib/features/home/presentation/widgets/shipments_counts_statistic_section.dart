import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/features/home/core/errors/home_error_handler.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/new_shipment_card_item_widget.dart';
import 'package:saayer/features/home/presentation/widgets/shipments_statistic_item_widget.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

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
        var statisticsTypesList =
            UserUtils.isAdmin() ? homeBloc.adminStatisticsTypesList : homeBloc.statisticsTypesList;
        var shipmentsCount =
            UserUtils.isAdmin() ? homeBloc.adminShipmentsCountResponse : homeBloc.shipmentsCountResponse;
        return (isLoading || shipmentsCount == null)
            ? const GridShimmerWidget()
            : hasError
                ? const NewShipmentCardItemWidget()
                : GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: largerThanTablet(context) ? 3 : 1.8,
                      mainAxisSpacing: (8 * 2),
                      crossAxisSpacing: (8 * 2),
                    ),
                    itemCount: statisticsTypesList.length,
                    itemBuilder: (context, index) {
                      return ShipmentsStatisticItemWidget(
                        onTap: (statisticsTypesList[index] == ShipmentsStatisticsTypes.NEW_SHIPMENT ||
                                statisticsTypesList[index] == ShipmentsStatisticsTypes.CLIENTS)
                            ? () {
                                if (UserUtils.isAdmin()) {
                                  final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
                                  viewPageBloc.add(const GoToPage(navBarIconType: NavBarIconTypes.CLIENTS));
                                } else {
                                  getIt<NavigationService>().navigateToNamed(Routes.requestNewShipmentNamedPage);
                                }
                              }
                            : () {
                                final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
                                viewPageBloc.add(SetShipmentsFiltersValue(
                                  initExportShipmentStatusFilter: _getShipmentStatus(statisticsTypesList[index]),
                                  exportShipmentDateFrom: null,
                                  exportShipmentDateTo: null,
                                ));
                                viewPageBloc.add(const GoToPage(navBarIconType: NavBarIconTypes.SHIPMENTS));
                              },
                        animatedIcon: index == 0 ? false : true,
                        title: statisticsTypesList[index].name,
                        shipmentsNum: _getTotalShipmentsCount(statisticsTypesList[index],
                            homeBloc.shipmentsCountResponse, homeBloc.adminShipmentsCountResponse),
                      );
                    },
                  );
      },
    );
  }

  _getTotalShipmentsCount(ShipmentsStatisticsTypes shipmentsStatusType, ShipmentsCountResponse? shipmentsCountResponse,
      ShipmentsCountResponseLAdmin? adminShipmentsCountResponse) {
    if (UserUtils.isAdmin()) {
      switch (shipmentsStatusType) {
        case ShipmentsStatisticsTypes.NEW_SHIPMENT:
          {
            return 'request'.tr();
          }
        case ShipmentsStatisticsTypes.CLIENTS:
          {
            return adminShipmentsCountResponse?.clientsCount.toString();
          }
        case ShipmentsStatisticsTypes.SHIPMENTS:
          {
            return adminShipmentsCountResponse!.totalShipments.toString();
          }
        case ShipmentsStatisticsTypes.REQUESTED:
          {
            return adminShipmentsCountResponse!.requestedShipments.toString();
          }
        case ShipmentsStatisticsTypes.PICKED:
          {
            return adminShipmentsCountResponse!.pickedShipments.toString();
          }
        case ShipmentsStatisticsTypes.SHIPPING:
          {
            return adminShipmentsCountResponse!.onTheWayShipments.toString();
          }
        case ShipmentsStatisticsTypes.DELIVERED:
          {
            return adminShipmentsCountResponse!.deliveredShipments.toString();
          }
      }
    } else {
      switch (shipmentsStatusType) {
        case ShipmentsStatisticsTypes.NEW_SHIPMENT:
          {
            return 'request'.tr();
          }
        case ShipmentsStatisticsTypes.CLIENTS:
          {
            return '0';
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

  ShipmentStatusEnum? _getShipmentStatus(ShipmentsStatisticsTypes status) {
    switch (status) {
      case ShipmentsStatisticsTypes.NEW_SHIPMENT:
        {
          return null;
        }
      case ShipmentsStatisticsTypes.CLIENTS:
        {
          return null;
        }
      case ShipmentsStatisticsTypes.REQUESTED:
        {
          return ShipmentStatusEnum.requested;
        }
      case ShipmentsStatisticsTypes.PICKED:
        {
          return ShipmentStatusEnum.picked;
        }
      case ShipmentsStatisticsTypes.SHIPPING:
        {
          return ShipmentStatusEnum.onTheWay;
        }
      case ShipmentsStatisticsTypes.DELIVERED:
        {
          return ShipmentStatusEnum.delivered;
        }
      default:
        {
          return null;
        }
    }
  }
}
