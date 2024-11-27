import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/presentation/bloc/add_edit_address_bloc.dart';
import 'package:saayer/features/address/add_edit_address/presentation/pages/add_edit_address_page.dart';

class AddEditAddressScreen extends StatelessWidget {
  final bool isAddShipmentRequest;
  final CustomerGetDto customerModel;
  final AddEditAddressType addEditAddressType;

  const AddEditAddressScreen(
      {super.key,
      required this.isAddShipmentRequest,
      required this.addEditAddressType,
      required this.customerModel});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider<AddEditAddressBloc>(
          create: (context) {
            final AddEditAddressBloc bloc = getIt<AddEditAddressBloc>();
            bloc.add(InitAddAddress(
                isEnglish: Localization.isEnglish(),
                isAddShipmentRequest: isAddShipmentRequest,
                addEditAddressType: addEditAddressType));
            bloc.add(const GetCountries());
            if (addEditAddressType == AddEditAddressType.editAddress) {
              bloc.add(SetUpdateValues(customerModel: customerModel));
            }
            return bloc;
          },
          child: AddEditAddressPage(
            isAddShipmentRequest: isAddShipmentRequest,
            addEditAddressType: addEditAddressType,
          )),
    );
  }
}
