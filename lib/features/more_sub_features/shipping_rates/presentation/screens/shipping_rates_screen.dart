import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/bloc/shipping_rates_bloc.dart';
import 'package:saayer/features/more_sub_features/shipping_rates/presentation/pages/shipping_rates_page.dart';

class ShippingRatesScreen extends StatelessWidget {
  const ShippingRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShippingRatesBloc>(),
      child: const ShippingRatesPage(),
    );
  }
}
