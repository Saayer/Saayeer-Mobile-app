import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/tab_bar/saayer_tab_bar.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/details/shipment_details_widget.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/widgets/tracking/shipment_tracking_widget.dart';

class ShipmentDetailsTabBar extends StatefulWidget {
  final int tabIndex;

  const ShipmentDetailsTabBar({super.key, this.tabIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _ShipmentDetailsTabBarState();
  }
}

class _ShipmentDetailsTabBarState extends State<ShipmentDetailsTabBar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(widget.tabIndex);
  }

  static const List<ShipmentDetailsTypeTab> _tabs = [
    ShipmentDetailsTypeTab(tabTitle: "shipment_details"),
    ShipmentDetailsTypeTab(tabTitle: "shipment_tracking"),
  ];

  @override
  Widget build(BuildContext context) {
    final ShipmentDetailsBloc shipmentDetailsBloc = BlocProvider.of<ShipmentDetailsBloc>(context);
    final double width = MediaQuery.of(context).size.width;

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

  Widget _buildBodyWidget(ShipmentDetailsBloc shipmentDetailsBloc, double width) {
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
                shipmentDetailsBloc.state.shipmentDto != null
                    ? const ShipmentDetailsWidget()
                    : const SizedBox(),
                shipmentDetailsBloc.state.shipmentTrackingEntity != null
                    ? const ShipmentTrackingWidget()
                    : const SizedBox(),

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

    return SizedBox(
      width: width / 1.5,
      child: Tab(
        text: tabTitle.tr(),
      ),
    );
  }
}
