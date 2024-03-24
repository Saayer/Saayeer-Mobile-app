import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'package:saayer/features/address/add_address/presentation/pages/add_address_page.dart';

class AddAddressScreen extends StatelessWidget {
  final bool isAddShipmentRequest;
  final void Function(AddressInfoEntity)? onBack ;
  const AddAddressScreen({super.key, required this.isAddShipmentRequest, this.onBack, });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<AddAddressBloc>(
        create: (context) {
          final AddAddressBloc bloc = getIt<AddAddressBloc>();
          bloc.add(InitAddAddress(
              isEnglish: Localization.isEnglish(),
              isAddShipmentRequest: isAddShipmentRequest));
          return bloc;
        },
        child: AddAddressPage(isAddShipmentRequest: isAddShipmentRequest , onBack: onBack,));
  }
}
