import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/addresses_book/presentation/screens/addresses_book_screen.dart';
import 'package:saayer/features/clients/presentation/screens/clients_screen.dart';
import 'package:saayer/features/request_new_shipment/presentation/screens/request_new_shipment_screen.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/domain/entities/nav_bar_icon_entity.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/bottom_navigation_bar.dart';
import 'package:saayer/features/view_page/presentation/widgets/floating_action_button.dart';
import 'package:saayer/features/home/presentation/screens/home_screen.dart';
import 'package:saayer/features/more/presentation/screens/more_screen.dart';
import 'package:saayer/features/shipments/presentation/screens/shipments_screen.dart';
import 'package:saayer/features/view_page/presentation/widgets/side_menu_navigation_web.dart';

class ViewPagePage extends StatelessWidget {
  const ViewPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.LOADED) {}
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        if (state.isGuest == null) {
          return Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          );
        }
        final NavBarIconEntity selectedNavBarIconEntity = UserUtils.isAdmin()
            ? viewPageBloc.adminNavBarList.firstWhere((element) => element.isSelected)
            : viewPageBloc.navBarIconEntityList.firstWhere((element) => element.isSelected);
        final bool isHome = (selectedNavBarIconEntity.navBarIconType == NavBarIconTypes.HOME);
        final bool isRequestShipment = (selectedNavBarIconEntity.navBarIconType == NavBarIconTypes.REQUEST_SHIPMENT);
        return GeneralResponsiveScaledBoxWidget(
          child: Scaffold(
              backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              resizeToAvoidBottomInset: false,
              appBar: BaseAppBar(
                title: !isHome
                    ? UserUtils.isAdmin()
                        ? viewPageBloc.adminNavBarList
                            .firstWhere((element) => element.isSelected)
                            .navBarIconType
                            .name
                            .tr()
                        : viewPageBloc.navBarIconEntityList
                            .firstWhere((element) => element.isSelected)
                            .navBarIconType
                            .name
                            .tr()
                    : null,
                showBackLeading: false,
                showAppBar: isRequestShipment ? false : true,
                height: 50,
              ),
              floatingActionButton: largerThanMobile(context)
                  ? null
                  : UserUtils.isAdmin()
                      ? null
                      : const SaayerFloatingActionButton(),
              bottomNavigationBar: largerThanMobile(context) ? null : const SaayerBottomNavigationBar(),
              body: Row(
                children: [
                  if (largerThanMobile(context))
                    SideMenuNavigationWeb(
                      selectedNavBarIcon: selectedNavBarIconEntity,
                    ),
                  Expanded(child: _getBody(selectedNavBarIconEntity)),
                ],
              )),
        );
      },
    );
  }

  Widget _getBody(NavBarIconEntity navBarIconEntity) {
    switch (navBarIconEntity.navBarIconType) {
      case NavBarIconTypes.HOME:
        {
          return const HomeScreen();
        }
      case NavBarIconTypes.SHIPMENTS:
        {
          return const ShipmentsScreen();
        }
      case NavBarIconTypes.REQUEST_SHIPMENT:
        {
          return const RequestNewShipmentScreen();
        }
      case NavBarIconTypes.ADDRESESS:
        {
          return const AddressesBookScreen();
        }
      case NavBarIconTypes.MORE:
        {
          return const MoreScreen();
        }
      case NavBarIconTypes.CLIENTS:
        {
          return const ClientsScreen();
        }
    }
  }
}
