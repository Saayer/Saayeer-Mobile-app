import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/tab_bar/saayer_tab_bar.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipments_list_view.dart';

class ShipmentsTypesTabBar extends StatefulWidget {
  const ShipmentsTypesTabBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShipmentsTypesTabBarState();
  }
}

class _ShipmentsTypesTabBarState extends State<ShipmentsTypesTabBar> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: _tabs.length, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(tabBarListener);
    _tabController.animateTo(_tabController.index);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void tabBarListener() {
    _onTabChanged(BlocProvider.of<ShipmentsBloc>(context));
  }

  static const List<ShipmentsTypeTab> _tabs = [
    ShipmentsTypeTab(
      shipmentsType: ShipmentsListTypes.EXPORT,
    ),
    ShipmentsTypeTab(
      shipmentsType: ShipmentsListTypes.IMPORT,
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
            if (scrollNotification is ScrollEndNotification) {}
            return false;
          },
          child: _buildBodyWidget(shipmentsBloc),
        );
      },
    );
  }

  Widget _buildBodyWidget(ShipmentsBloc shipmentsBloc) {
    final bool isFromHome = shipmentsBloc.state.isFromHome;
    final Widget saayerTabBar = SaayerTabBar(
      horizontalPadding: isFromHome ? 10 : null,
      verticalPadding: isFromHome ? 12 : null,
      controller: _tabController,
      onTap: (index) {
        _onTabChanged(shipmentsBloc);
      },
      tabs: _tabs,
      labelStyle: isFromHome ? AppTextStyles.microLabel() : null,
    );
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          !(isFromHome) ? saayerTabBar : _buildHomeViewTabBarWidget(saayerTabBar),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: ShipmentsListTypes.values
                  .map((shipmentsType) => _getViewWidget(shipmentsBloc, shipmentsType))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getViewWidget(ShipmentsBloc shipmentsBloc, ShipmentsListTypes shipmentsListType) {
    switch (shipmentsListType) {
      case ShipmentsListTypes.EXPORT:
        {
          return ShipmentsListView(
            shipmentsList: shipmentsBloc.state.exportShipmentsList,
            shipmentsListType: shipmentsListType,
            scrollController: shipmentsBloc.exportScrollController,
            shipmentsBloc: shipmentsBloc,
          );
        }
      case ShipmentsListTypes.IMPORT:
        {
          return ShipmentsListView(
            shipmentsList: shipmentsBloc.state.importShipmentsList,
            shipmentsListType: shipmentsListType,
            scrollController: shipmentsBloc.importScrollController,
            shipmentsBloc: shipmentsBloc,
          );
        }
    }
  }

  _onTabChanged(ShipmentsBloc shipmentsBloc) {
    final ShipmentsListTypes selectedShipmentsType = ShipmentsListTypes.values[_tabController.index];
    _tabController.animateTo(_tabController.index);
    shipmentsBloc.add(SelectShipmentType(shipmentsType: selectedShipmentsType));
    if (selectedShipmentsType == ShipmentsListTypes.IMPORT) {
      if (shipmentsBloc.importShipmentsList.isEmpty) {
        shipmentsBloc.add(const GetImportShipments());
      }
    }
  }

  _buildHomeViewTabBarWidget(Widget saayerTabBar) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: screenWidth(context) / 1.4, height: 50, child: saayerTabBar),
        GestureDetector(
          onTap: () {
            final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
            viewPageBloc.add(const GoToPage(navBarIconType: NavBarIconTypes.SHIPMENTS));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "show_all".tr(),
                style: AppTextStyles.smallLabel(),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.arrow_forward_ios, size: 1, color: SaayerTheme().getColorsPalette.greyColor),
              SizedBox(
                width: 16,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ShipmentsTypeTab extends StatelessWidget {
  final ShipmentsListTypes shipmentsType;

  const ShipmentsTypeTab({super.key, required this.shipmentsType});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width / 1.5,
      child: Tab(
        text: shipmentsType.pluralName.tr(),
      ),
    );
  }
}
