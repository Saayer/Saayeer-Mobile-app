import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:saayer/features/clients/presentation/pages/clients_page.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final ClientsBloc bloc = getIt<ClientsBloc>();

        ///
        bloc.add(const GetClientsListByFilter());
        return bloc;
      },
      child: const ClientsPage(),
    );
  }
}
