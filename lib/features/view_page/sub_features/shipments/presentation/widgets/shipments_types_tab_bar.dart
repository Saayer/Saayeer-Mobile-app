import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/tab_bar/saayer_tab_bar.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/domain/entities/shipment_entity.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/widgets/empty_shipments.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/widgets/shipments_list_view.dart';

class ShipmentsTypesTabBar extends StatefulWidget {
  final int tabIndex;

  const ShipmentsTypesTabBar({super.key, this.tabIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _ShipmentsTypesTabBarState();
  }
}

class _ShipmentsTypesTabBarState extends State<ShipmentsTypesTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(widget.tabIndex);
  }

  static const List<ShipmentsTypeTab> _tabs = [
    ShipmentsTypeTab(
      shipmentsType: ShipmentsTypes.INCOMING,
    ),
    ShipmentsTypeTab(
      shipmentsType: ShipmentsTypes.OUTBOUND,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ShipmentsBloc shipmentsBloc = BlocProvider.of<ShipmentsBloc>(context);
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification) {
              _onTabChanged(shipmentsBloc);
            }
            return false;
          },
          child: _buildBodyWidget(shipmentsBloc),
        );
      },
    );
  }

  Widget _buildBodyWidget(ShipmentsBloc shipmentsBloc) {
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
              children: ShipmentsTypes.values
                  .map((shipmentsType) => _getViewWidget(
                      shipmentsBloc
                              .state.shipmentEntityListMap?[shipmentsType] ??
                          [],
                      shipmentsType))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getViewWidget(
      List<ShipmentEntity> shipmentEntityList, ShipmentsTypes shipmentsType) {
    if (shipmentEntityList.isEmpty) {
      return EmptyShipments(shipmentsType: shipmentsType);
    }
    return ShipmentsListView(shipmentEntityList: shipmentEntityList);
  }

  _onTabChanged(ShipmentsBloc shipmentsBloc) {
    final ShipmentsTypes currentShipmentsType =
        shipmentsBloc.state.selectedShipmentsType;
    final ShipmentsTypes selectedShipmentsType =
        ShipmentsTypes.values[_tabController.index];
    _tabController.animateTo(_tabController.index);
    log("$currentShipmentsType $selectedShipmentsType",
        name: "_tabController.index");
    if (selectedShipmentsType != currentShipmentsType) {
      shipmentsBloc
          .add(SelectShipmentType(shipmentsType: selectedShipmentsType));
    }
  }
}

class ShipmentsTypeTab extends StatelessWidget {
  final ShipmentsTypes shipmentsType;

  const ShipmentsTypeTab({super.key, required this.shipmentsType});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width / 1.5,
      child: Tab(
        text: shipmentsType.pluralName.tr(),
      ),
    );
  }
}
