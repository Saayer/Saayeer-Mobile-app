import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/presentation/bloc/service_providers_management_bloc.dart';
import 'package:saayer/features/more_sub_features/admin_service_providers_management/presentation/pages/service_providers_management_page.dart';

class ServiceProvidersManagementScreen extends StatelessWidget {
  const ServiceProvidersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider(
        create: (context) {
          final ServiceProvidersManagementBloc bloc = getIt<ServiceProvidersManagementBloc>();
          bloc.add(const GetServiceProvidersList());
          return bloc;
        },
        child: const ServiceProvidersManagementPage(),
      ),
    );
  }
}
