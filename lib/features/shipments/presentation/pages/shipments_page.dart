import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/shipments/core/errors/shipments_error_handler.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/widgets/admin/admin_shipments_list_page.dart';
import 'package:saayer/features/shipments/presentation/widgets/shipments_types_tab_bar.dart';

class ShipmentsPage extends StatelessWidget {
  const ShipmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShipmentsBloc shipmentsBloc = BlocProvider.of<ShipmentsBloc>(context);
    return BlocConsumer<ShipmentsBloc, ShipmentsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (shipmentsBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ///
            ShipmentsErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: state.isFromHome ? Colors.transparent : SaayerTheme().getColorsPalette.backgroundColor,
            body: UserUtils.isAdmin()
                ? AdminShipmentsListPage(
                    scrollController: shipmentsBloc.adminShipmentsScrollController,
                    shipmentsBloc: shipmentsBloc,
                  )
                : const ShipmentsTypesTabBar(),
          ),
        );
      },
    );
  }
}
