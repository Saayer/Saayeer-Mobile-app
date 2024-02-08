import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/domain/entities/nav_bar_icon_entity.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/bottom_navigation_bar.dart';
import 'package:saayer/features/view_page/presentation/widgets/floating_action_button.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/screens/home_screen.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/screens/more_screen.dart';
import 'package:saayer/features/view_page/sub_features/profile/presentation/screens/ebills_screen.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/screens/request_shipment_screen.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/screens/shipments_screen.dart';

class ViewPagePage extends StatelessWidget {
  const ViewPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (viewPageBloc.state.stateHelper.requestState ==
            RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        final NavBarIconEntity selectedNavBarIconEntity = viewPageBloc
            .navBarIconEntityList
            .firstWhere((element) => element.isSelected);
        final bool isHome =
            (selectedNavBarIconEntity.navBarIconType == NavBarIconTypes.HOME);
        return Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            appBar: BaseAppBar(
                title: !isHome
                    ? viewPageBloc.navBarIconEntityList
                        .firstWhere((element) => element.isSelected)
                        .navBarIconType
                        .name
                        .tr()
                    : null,
                showBackLeading: false,
                height: 50,
                actions: [
                  if (isHome)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                        size: 25.r,
                      ),
                    ),
                ]),
            floatingActionButton: const SaayerFloatingActionButton(),
            bottomNavigationBar: const SaayerBottomNavigationBar(),
            body: _getBody(selectedNavBarIconEntity));
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
          return const RequestShipmentScreen();
        }
      case NavBarIconTypes.PROFILE:
        {
          return const ProfileScreen();
        }
      case NavBarIconTypes.MORE:
        {
          return const MoreScreen();
        }
    }
  }
}
