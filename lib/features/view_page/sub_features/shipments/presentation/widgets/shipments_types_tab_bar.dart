import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';

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
      shipmentsType: ShipmentsTypes.INBOUND,
    ),
    ShipmentsTypeTab(
      shipmentsType: ShipmentsTypes.OUTBOUND,
    ),
  ];

  final List<Widget> _views = [
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.amber,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification) {
              _onTabChanged();
            }
            return false;
          },
          child: _buildBodyWidget(),
        );
      },
    );
  }

  Widget _buildBodyWidget() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            onTap: (index) {},
            tabs: _tabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _views,
            ),
          ),
        ],
      ),
    );
  }

  _onTabChanged() {
    final bloc = BlocProvider.of<ShipmentsBloc>(context);
    final ShipmentsTypes currentShipmentsType = bloc.state.shipmentsType!;
    final ShipmentsTypes selectedShipmentsType =
        ShipmentsTypes.values[_tabController.index];
    _tabController.animateTo(_tabController.index);
    log("$currentShipmentsType $selectedShipmentsType",
        name: "_tabController.index");
    if (selectedShipmentsType != currentShipmentsType) {
      bloc.add(SelectShipmentType(shipmentsType: selectedShipmentsType));
    }
  }
}

class ShipmentsTypeTab extends StatelessWidget {
  final ShipmentsTypes shipmentsType;

  const ShipmentsTypeTab({super.key, required this.shipmentsType});

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: shipmentsType.pluralName.tr(),
    );
  }
}
