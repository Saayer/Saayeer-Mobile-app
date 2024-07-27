import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_address/core/errors/add_address_error_handler.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'package:saayer/features/address/add_address/presentation/widgets/address_text_field_helper.dart';

class AddAddressPage extends StatefulWidget {
  final bool isAddShipmentRequest;

  final void Function(CustomerAddDto)? onBack;

  const AddAddressPage({
    super.key,
    required this.isAddShipmentRequest,
    this.onBack,
  });

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final AddAddressBloc addAddressBloc = BlocProvider.of<AddAddressBloc>(context);
    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<AddAddressBloc, AddAddressState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) async {
          final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {
              if (widget.isAddShipmentRequest) {
                Navigator.pop(context);
              } else {
                print('isAddShipmentRequest');
                widget.onBack!(state.addressInfoEntity!);
              }
            }
            if (state.stateHelper.requestState == RequestState.ERROR) {
              //showToast(msg: state.stateHelper.errorMessage ?? "");
              AddAddressErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) => PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            appBar: BaseAppBar(
              title: "add_address".tr(),
              showBackLeading: true,
              showAppBar: widget.isAddShipmentRequest,
            ),
            bottomSheet: _buildConfirmButton(addAddressBloc, width),
            body: _buildAddAddressFieldsWidget(addAddressBloc, width, state),
          ),
        ),
      ),
    );
  }

  Widget _getTextField(AddAddressBloc addAddressBloc, AddAddressFieldsTypes addAddressFieldsType) {
    return AddressTextFieldHelper(addAddressBloc: addAddressBloc, addAddressFieldsType: addAddressFieldsType)
        .getTextField();
  }

  _buildConfirmButton(AddAddressBloc addAddressBloc, double width) {
    return Container(
      width: width,
      color: SaayerTheme().getColorsPalette.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SaayerDefaultTextButton(
          text: "confirm",
          isEnabled: enableAddress(addAddressBloc),
          borderRadius: 16,
          onPressed: () {
            final bool isFormValid = (addAddressBloc.formKey.currentState!.validate());
            addAddressBloc.add(ToggleAutoValidate());
            isFormValid
                ? addAddressBloc.add(SubmitAddressData())
                : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
          },
          btnWidth: width / 1.2,
          btnHeight: 50,
        ),
      ),
    );
  }

  _buildAddAddressFieldsWidget(AddAddressBloc addAddressBloc, double width, AddAddressState state) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: SaayerTheme().getColorsPalette.backgroundColor,
        child: Center(
          child: Form(
            autovalidateMode: state.autoValidateMode,
            key: addAddressBloc.formKey,
            child: Column(
              children: [
                Expanded(
                  child: ResponsiveGridView.builder(
                    alignment: Alignment.centerRight,
                    gridDelegate: ResponsiveGridDelegate(
                        crossAxisExtent: ResponsiveBreakpoints.of(context).isMobile ? width / 1.11 : 370,
                        maxCrossAxisExtent: 4,
                        minCrossAxisExtent: 1,
                        childAspectRatio: 1 / 0.34,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemCount: AddAddressFieldsTypes.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _getTextField(addAddressBloc, AddAddressFieldsTypes.values[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool enableAddress(AddAddressBloc addAddressBloc) {
    // log("${addAddressBloc.addAddressFieldsValidMap}",
    //     name: "enableAddress --->");
    if (addAddressBloc.addAddressFieldsValidMap.values.length == AddAddressFieldsTypes.values.length) {
      return addAddressBloc.addAddressFieldsValidMap.values.every((element) => element == true);
    }
    return false;
  }
}
