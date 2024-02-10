import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/view_page/sub_features/shipments/presentation/pages/shipments_page.dart';

class ShipmentsScreen extends StatelessWidget {
  const ShipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShipmentsBloc>()..add(InitShipments()),
      child: const ShipmentsPage(),
    );
  }
}
