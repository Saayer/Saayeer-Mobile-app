import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/pages/shipments_page.dart';

class ShipmentsScreen extends StatelessWidget {
  final bool isFromHome;

  const ShipmentsScreen({super.key, this.isFromHome = false});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocProvider(
      create: (context) => getIt<ShipmentsBloc>()
        ..add(InitShipments(
            isFromHome: isFromHome, isGuest: viewPageBloc.state.isGuest)),
      child: const ShipmentsPage(),
    );
  }
}
