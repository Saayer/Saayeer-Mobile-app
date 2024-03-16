import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart';
import 'package:saayer/features/address/address_details/presentation/pages/address_details_page.dart';

class AddressDetailsScreen extends StatelessWidget {
  final AddressInfoEntity addressInfoEntity;

  const AddressDetailsScreen({super.key, required this.addressInfoEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final AddressDetailsBloc bloc = getIt<AddressDetailsBloc>();
        bloc.add(InitAddressDetails(addressInfoEntity: addressInfoEntity));
        return bloc;
      },
      child: const AddressDetailsPage(),
    );
  }
}
