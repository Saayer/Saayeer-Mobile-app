import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/domain/entities/nav_bar_icon_entity.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/bottom_navigation_bar.dart';
import 'package:saayer/features/view_page/presentation/widgets/floating_action_button.dart';
import 'package:saayer/features/view_page/sub_features/ebills/presentation/screens/ebills_screen.dart';
import 'package:saayer/features/view_page/sub_features/home/presentation/screens/home_screen.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/screens/more_screen.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/screens/request_shipment_screen.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/screens/shipments_screen.dart';

class ViewPagePage extends StatelessWidget {
  const ViewPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final NavBarIconEntity selectedNavBarIconEntity = viewPageBloc
            .navBarIconEntityList
            .firstWhere((element) => element.isSelected);
        return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
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
      case NavBarIconTypes.EBILLS:
        {
          return const EbillsScreen();
        }
      case NavBarIconTypes.MORE:
        {
          return const MoreScreen();
        }
    }
  }
}
