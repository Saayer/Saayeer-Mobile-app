import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/core/errors/service_providers_management_error_handler.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/presentation/bloc/service_providers_management_bloc.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/presentation/widgets/empty_service_providers_list.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/presentation/widgets/service_providers_item_widget.dart';

class ServiceProvidersManagementPage extends StatelessWidget {
  const ServiceProvidersManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceProvidersManagementBloc bloc = BlocProvider.of<ServiceProvidersManagementBloc>(context);
    return BlocConsumer<ServiceProvidersManagementBloc, ServiceProvidersManagementState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            ServiceProvidersManagementErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        appBar: const BaseAppBar(title: 'service_providers_management', showBackLeading: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Expanded(
                  child: state.serviceProvidersList == null
                      ? const ShimmerWidget()
                      : _buildServiceProvidersListWidget(bloc)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _buildServiceProvidersListWidget(ServiceProvidersManagementBloc bloc) {
    if (bloc.state.serviceProvidersList!.isEmpty) {
      return const EmptyServiceProvidersList();
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: bloc.serviceProvidersList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ServiceProvidersItemWidget(
              serviceProvidersItem: bloc.serviceProvidersList[index],
              onChanged: !(bloc.serviceProvidersList[index].isImplemented ?? false)
                  ? null
                  : (value) {
                      bloc.add(UpdateServiceProvider(
                          logisticServicePostDto: LogisticServicePostDto((b) => b
                            ..logisticServiceId = bloc.serviceProvidersList[index].logisticServiceId
                            ..isEnabled = !(bloc.serviceProvidersList[index].isEnabled ?? false))));
                    },
            ),
          );
        });
  }
}
