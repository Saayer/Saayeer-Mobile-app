import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/presentation/bloc/shipping_partners_bloc.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/presentation/pages/shipping_partners_page.dart';

class ShippingPartnersScreen extends StatelessWidget {
  const ShippingPartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider<ShippingPartnersBloc>(
          create: (context) {
            final ShippingPartnersBloc bloc = getIt<ShippingPartnersBloc>();
            bloc.add(const GetShippingPartners());
            return bloc;
          },
          child: const ShippingPartnersPage()),
    );
  }
}
