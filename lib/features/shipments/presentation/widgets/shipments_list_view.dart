import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/widgets/empty_shipments.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipments_filters_widget.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/screens/shipment_details_screen.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipment_item_widget_helper.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';

class ShipmentsListView extends StatefulWidget {
  final List<ShipmentGetDto>? shipmentsList;
  final ShipmentsListTypes shipmentsListType;
  final ScrollController scrollController;
  final ShipmentsBloc shipmentsBloc;

  const ShipmentsListView({
    super.key,
    required this.shipmentsList,
    required this.shipmentsListType,
    required this.scrollController,
    required this.shipmentsBloc,
  });

  @override
  State<ShipmentsListView> createState() => _ShipmentsListViewState();
}

class _ShipmentsListViewState extends State<ShipmentsListView> {
  @override
  initState() {
    widget.scrollController.addListener(() => widget.shipmentsBloc.add(const OnScrollPagination()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bool isFromHome = state.isFromHome;
        return RefreshIndicator(
          onRefresh: () async {
            widget.shipmentsBloc.add(RefreshShipments());
          },
          color: SaayerTheme().getColorsPalette.primaryColor,
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              if (! widget.shipmentsBloc.state.isFromHome)
                ShipmentsFiltersWidget(
                  shipmentsBloc:  widget.shipmentsBloc,
                  shipmentsListType: widget.shipmentsListType,
                ),
              const SizedBox(
                height: 10,
              ),
              widget.shipmentsList == null
                  ? const Expanded(child: ShimmerWidget())
                  : _buildShipmentsListWidget(isFromHome),
            ],
          ),
        );
      },
    );
  }

  _buildShipmentsListWidget(bool isFromHome) {
    if (widget.shipmentsList!.isEmpty) {
      return Expanded(child: EmptyShipments(shipmentsType: widget.shipmentsListType));
    }
    return Expanded(
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.shipmentsList?.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final ShipmentGetDto shipmentEntity = widget.shipmentsList![index];
              final bool isLast = (index == widget.shipmentsList!.length - 1);
              Widget shipmentWidget;
              shipmentWidget = ShipmentItemWidgetHelper().getShipmentWidget(
                shipmentDto: shipmentEntity,
                isFromHome: isFromHome,
                shipmentsListType: widget.shipmentsListType,
              );
              return Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        getIt<NavigationService>().navigateTo(ShipmentDetailsScreen(shipmentDto: shipmentEntity));
                      },
                      child: shipmentWidget),
                  if (isLast)
                    const SizedBox(
                      height: 50,
                    )
                ],
              );
            }),
      ),
    );
  }
}
