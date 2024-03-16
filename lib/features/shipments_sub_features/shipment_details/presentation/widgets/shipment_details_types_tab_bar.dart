import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_container.dart';
import 'package:saayer/common/tab_bar/saayer_tab_bar.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/details/shipment_details_widget.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/tracking/shipment_tracking_widget.dart';

class ShipmentDetailsTabBar extends StatefulWidget {
  final int tabIndex;

  const ShipmentDetailsTabBar({super.key, this.tabIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _ShipmentDetailsTabBarState();
  }
}

class _ShipmentDetailsTabBarState extends State<ShipmentDetailsTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(widget.tabIndex);
  }

  static const List<ShipmentDetailsTypeTab> _tabs = [
    ShipmentDetailsTypeTab(tabTitle: "shipment_tracking"),
    ShipmentDetailsTypeTab(tabTitle: "shipment_details"),
  ];

  @override
  Widget build(BuildContext context) {
    final ShipmentDetailsBloc shipmentDetailsBloc =
        BlocProvider.of<ShipmentDetailsBloc>(context);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification) {}
            return false;
          },
          child: _buildBodyWidget(shipmentDetailsBloc, width),
        );
      },
    );
  }

  Widget _buildBodyWidget(
      ShipmentDetailsBloc shipmentDetailsBloc, double width) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SaayerTabBar(
            controller: _tabController,
            onTap: (index) {},
            tabs: _tabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                shipmentDetailsBloc.state.shipmentTrackingEntity != null
                    ? const ShipmentTrackingWidget()
                    : const SizedBox(),
                shipmentDetailsBloc.state.shipmentDetailsEntity != null
                    ? const ShipmentDetailsWidget()
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShipmentDetailsTypeTab extends StatelessWidget {
  final String tabTitle;

  const ShipmentDetailsTypeTab({super.key, required this.tabTitle});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width / 1.5,
      child: Tab(
        text: tabTitle.tr(),
      ),
    );
  }
}
