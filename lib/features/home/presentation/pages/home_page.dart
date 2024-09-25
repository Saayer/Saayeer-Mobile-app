import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/home/core/errors/home_error_handler.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/generic_data_bar_chart_widget.dart';
import 'package:saayer/features/home/presentation/widgets/shipments_statistic_item_widget.dart';
import 'package:saayer/features/request_new_shipment/presentation/screens/request_new_shipment_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    bool isLoading = false;
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.LOADED) {}
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            HomeErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              (isLoading || homeBloc.shipmentsCountResponse == null)
                  ? SizedBox()
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
                    ),
              const SizedBox(
                height: 20,
              ),
              GenericDataBarChartWidget(
                title: ["shipments_chart_title".tr()].concatenatingListOfStrings,
                yAxisTitle: "shipments".tr(),
                total: '500 ${'shipment'.tr()}',
                xAxisDataTitles: shipmentsXAxisData,
                showHorizontalLine: true,
              ),
              const SizedBox(
                height: 20,
              ),
              GenericDataBarChartWidget(
                title: ["payments_chart_title".tr()].concatenatingListOfStrings,
                yAxisTitle: 'sr'.tr(),
                total: '500 ${'sr'.tr()}',
                xAxisDataTitles: paymentsXAxisData,
                showHorizontalLine: true,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> get shipmentsXAxisData {
    final List<String> requiredList = [];

    for (int i = 1; i < 31; i++) {
      if (i == 1 || i == 5 || i == 10 || i == 15 || i == 20 || i == 25 || i == 30) {
        requiredList.add('$i');
      } else {
        requiredList.add('');
      }
    }

    return requiredList;
  }

  List<String> get paymentsXAxisData {
    final List<String> requiredList = [];

    for (int i = 1; i < 31; i++) {
      if (i == 1 || i == 5 || i == 10 || i == 15 || i == 20 || i == 25 || i == 30) {
        requiredList.add('$i');
      } else {
        requiredList.add('');
      }
    }

    return requiredList;
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
