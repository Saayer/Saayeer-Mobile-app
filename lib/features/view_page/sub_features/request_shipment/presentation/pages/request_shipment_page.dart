import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_edit_address/presentation/screens/add_edit_address_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/domain/entities/shipment_specs_entity.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/screens/shipment_specs_screen.dart';
import 'package:saayer/features/user_info_view_page/presentation/widgets/linear_indicator.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_preview/presentation/screens/shipment_preview_screen.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipments_cariers_selection/presentation/screens/carriers_shipment_screen.dart';

class RequestShipmentPage extends StatelessWidget {
  const RequestShipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final RequestShipmentBloc requestShipmentBloc =
        BlocProvider.of<RequestShipmentBloc>(context);
    final List<Widget> pages = [
      AddEditAddressScreen(
        isAddShipmentRequest: false,
        addEditAddressType: AddEditAddressType.addAddress,
        customerModel: CustomerGetDto(),
        onBack: (CustomerAddDto addressInfoEntity) {
          //requestShipmentBloc.add(AddAddressInfoEvent(addressInfoEntity));
        },
      ),
      ShipmentSpecsScreen(
        isAddShipmentRequest: false,
        onBack: (ShipmentSpecsEntity shipmentSpecsEntity) {
          requestShipmentBloc.add(AddShipmentSpecsEvent(shipmentSpecsEntity));
        },
      ),
      CarriersShipmentScreen(),
      ShipmentPreviewScreen(),
    ];

    return BlocConsumer<RequestShipmentBloc, RequestShipmentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (requestShipmentBloc.state.stateHelper.requestState ==
                RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

// if (!isLoading) {
        //   if (state.stateHelper.requestState == RequestState.SUCCESS) {
        //     getIt<NavigationService>()
        //         .navigateAndFinish(const ViewPageScreen());
        //   }
        //   if (state.stateHelper.requestState == RequestState.ERROR) {}
        // }
      },
      builder: (context, state) {
        return PopScope(
          canPop: true,
          child: Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            appBar: BaseAppBar(
              showBackLeading: true,
              title: 'request_shipment'.tr(),
            ),
            body: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                  color: SaayerTheme().getColorsPalette.backgroundColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: List.generate(4, (index) {
                          final bool isPrevious = (state.currentPage > index);
                          final bool isCurrent = (state.currentPage == index);
                          return SizedBox(
                              width: width / 4,
                              child: LinearIndicator(
                                color: isPrevious
                                    ? (SaayerTheme()
                                        .getColorsPalette
                                        .superDarkOrangeColor)
                                    : isCurrent
                                        ? (SaayerTheme()
                                            .getColorsPalette
                                            .primaryColor)
                                        : (SaayerTheme()
                                            .getColorsPalette
                                            .greyColor),
                              ));
                        }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Flexible(
                          fit: FlexFit.tight, child: pages[state.currentPage])
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
