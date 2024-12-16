import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/pages/shipments_page.dart';

class ShipmentsScreen extends StatelessWidget {
  final bool isFromHome;

  const ShipmentsScreen({super.key, this.isFromHome = false});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocProvider(
      create: (context) {
        final ShipmentsBloc bloc = getIt<ShipmentsBloc>();
        if (UserUtils.isAdmin()) {
          ///
          bloc.add(InitShipments(
            isFromHome: isFromHome,
            isGuest: viewPageBloc.state.isGuest!,
            initExportShipmentStatusFilter: viewPageBloc.initExportShipmentsStatusFilter,
            exportShipmentDateFrom: viewPageBloc.exportShipmentDateFrom,
            exportShipmentDateTo: viewPageBloc.exportShipmentDateTo,
          ));
          bloc.add(const GetAdminShipmentsList());
          bloc.add(const GetServiceProviders());
          bloc.add(const GetClientsList());
        } else {
          ///
          bloc.add(InitShipments(
            isFromHome: isFromHome,
            isGuest: viewPageBloc.state.isGuest!,
            initExportShipmentStatusFilter: viewPageBloc.initExportShipmentsStatusFilter,
            exportShipmentDateFrom: viewPageBloc.exportShipmentDateFrom,
            exportShipmentDateTo: viewPageBloc.exportShipmentDateTo,
          ));
          bloc.add(const SelectShipmentType(shipmentsType: ShipmentsListTypes.EXPORT));
          bloc.add(const GetExportShipments());
          bloc.add(const GetStores());
          bloc.add(const GetServiceProviders());
        }
        return bloc;
      },
      child: const ShipmentsPage(),
    );
  }
}
