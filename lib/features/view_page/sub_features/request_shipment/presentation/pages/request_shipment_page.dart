import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_address/presentation/screens/add_address_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_providers/presentation/screens/shipment_providers_screen.dart';
import 'package:saayer/features/user_info_view_page/presentation/widgets/linear_indicator.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/pages/address_shipment_page.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/address_shipment/presentation/screens/address_shipment_screen.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_information/presentation/screens/information_shipment_screen.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipments_cariers_selection/presentation/screens/carriers_shipment_screen.dart';

class RequestShipmentPage extends StatelessWidget {
  const RequestShipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final RequestShipmentBloc userInfoViewPageBloc =
        BlocProvider.of<RequestShipmentBloc>(context);
    final List<Widget> pages = [
      const ShipmentProvidersScreen(),
      const AddAddressScreen(),
      const CarriersShipmentScreen()
    ];

    return BlocConsumer<RequestShipmentBloc, RequestShipmentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (userInfoViewPageBloc.state.stateHelper.requestState ==
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
                        children: List.generate(3, (index) {
                          final bool isPrevious = (state.currentPage > index);
                          final bool isCurrent = (state.currentPage == index);
                          return SizedBox(
                              width: width / 3,
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
