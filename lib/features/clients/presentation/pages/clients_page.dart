import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/clients/core/errors/clients_error_handler.dart';
import 'package:saayer/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:saayer/features/clients/presentation/widgets/clients_filters_widget.dart';
import 'package:saayer/features/clients/presentation/widgets/clients_list_widget.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ClientsBloc clientsBloc = BlocProvider.of<ClientsBloc>(context);
    return BlocConsumer<ClientsBloc, ClientsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (clientsBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ///
            ClientsErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: RefreshIndicator(
            onRefresh: () async {
              clientsBloc.add(RefreshClients());
            },
            color: SaayerTheme().getColorsPalette.primaryColor,
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ClientsFiltersWidget(
                  clientsBloc: clientsBloc,
                ),
                const SizedBox(
                  height: 10,
                ),
                clientsBloc.state.clientsList == null
                    ? const Expanded(child: ShimmerWidget())
                    : ClientsListWidget(
                        clientsBloc: clientsBloc,
                        scrollController: clientsBloc.clientsScrollController,
                        clientsList: clientsBloc.state.clientsList,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
