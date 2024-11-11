import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_edit_address/core/errors/add_address_error_handler.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/presentation/bloc/add_edit_address_bloc.dart';
import 'package:saayer/features/address/add_edit_address/presentation/widgets/address_text_field_helper.dart';

class AddEditAddressPage extends StatefulWidget {
  final bool isAddShipmentRequest;
  final AddEditAddressType addEditAddressType;

  const AddEditAddressPage({
    super.key,
    required this.isAddShipmentRequest,
    required this.addEditAddressType,
  });

  @override
  State<AddEditAddressPage> createState() => _AddEditAddressPageState();
}

class _AddEditAddressPageState extends State<AddEditAddressPage> {
  ///
  GlobalKey zipCodeKey = GlobalKey<State<StatefulWidget>>();
  GlobalKey addressKey = GlobalKey<State<StatefulWidget>>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final AddEditAddressBloc addAddressBloc = BlocProvider.of<AddEditAddressBloc>(context);
    return BlocConsumer<AddEditAddressBloc, AddEditAddressState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            if (widget.isAddShipmentRequest) {
              getIt<NavigationService>().pop(state.submitAddressInfoEntity);
            } else {
              print('isAddShipmentRequest');
            }
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            AddAddressErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
          title: "add_address".tr(),
          showBackLeading: true,
          showAppBar: widget.isAddShipmentRequest,
        ),
        bottomSheet: _buildConfirmButton(addAddressBloc, width),
        body: _buildAddAddressFieldsWidget(addAddressBloc, width, state),
      ),
    );
  }

  Widget _getTextField(AddEditAddressBloc addAddressBloc, AddAddressFieldsTypes addAddressFieldsType) {
    return AddressTextFieldHelper(addAddressBloc: addAddressBloc, addAddressFieldsType: addAddressFieldsType)
        .getTextField(zipCodeKey: zipCodeKey, addressKey: addressKey);
  }

  _buildConfirmButton(AddEditAddressBloc addAddressBloc, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "confirm",
        isEnabled: enableAddress(addAddressBloc),
        borderRadius: 16,
        onPressed: () {
          final bool isFormValid = (addAddressBloc.formKey.currentState!.validate());
          addAddressBloc.add(ToggleAutoValidate());
          isFormValid
              ? widget.addEditAddressType == AddEditAddressType.addAddress
                  ? addAddressBloc.add(SubmitAddressData())
                  : addAddressBloc.add(const OnUpdateAddress())
              : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
        },
      ),
    );
  }

  _buildAddAddressFieldsWidget(AddEditAddressBloc addAddressBloc, double width, AddEditAddressState state) {
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
            child: ListView(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              children: [
                /// FullName & Phone & Alternative Phone & Email
                ResponsiveRowColumn(
                  layout: ResponsiveValue(context,
                          conditionalValues: [
                            const Condition.largerThan(breakpoint: 900, value: ResponsiveRowColumnType.ROW)
                          ],
                          defaultValue: ResponsiveRowColumnType.COLUMN)
                      .value,
                  columnVerticalDirection: VerticalDirection.down,
                  columnSpacing: 10,
                  rowSpacing: 15,
                  children: [
                    /// FullName & Phone
                    _buildFirstColumnRowField(addAddressBloc),

                    /// Alternative Phone & Email
                    _buildSecondColumnRowField(addAddressBloc),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                /// country & governorate & city & address
                ResponsiveRowColumn(
                  layout: ResponsiveValue(context,
                          conditionalValues: [
                            const Condition.largerThan(breakpoint: 900, value: ResponsiveRowColumnType.ROW)
                          ],
                          defaultValue: ResponsiveRowColumnType.COLUMN)
                      .value,
                  columnVerticalDirection: VerticalDirection.down,
                  columnSpacing: 10,
                  rowSpacing: 15,
                  children: [
                    /// country & governorate
                    _buildThirdColumnRowField(addAddressBloc),

                    /// city & address
                    _buildFourthColumnRowField(addAddressBloc),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                /// zipCode
                _buildFifthColumnRowField(addAddressBloc),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom + 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool enableAddress(AddEditAddressBloc addAddressBloc) {
    if (addAddressBloc.nameController.text.isNotEmpty &&
        (addAddressBloc.mobile.phoneNumber != null) &&
        addAddressBloc.addressController.text.isNotEmpty &&
        (addAddressBloc.selectedCountry != null) &&
        (addAddressBloc.selectedGovernorate != null) &&
        (addAddressBloc.selectedCity != null)) {
      return true;
    }
    return false;
  }

  _buildFirstColumnRowField(AddEditAddressBloc addAddressBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[0]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[1]),
            ),
          ],
        ));
  }

  _buildSecondColumnRowField(AddEditAddressBloc addAddressBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[2]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[3]),
            ),
          ],
        ));
  }

  _buildThirdColumnRowField(AddEditAddressBloc addAddressBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[4]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[5]),
            ),
          ],
        ));
  }

  _buildFourthColumnRowField(AddEditAddressBloc addAddressBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[6]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[7]),
            ),
          ],
        ));
  }

  _buildFifthColumnRowField(AddEditAddressBloc addAddressBloc) {
    return ResponsiveRowColumn(
      layout: ResponsiveValue(context,
              conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
              defaultValue: ResponsiveRowColumnType.COLUMN)
          .value,
      columnVerticalDirection: VerticalDirection.down,
      columnSpacing: 10,
      rowSpacing: 15,
      children: [
        ResponsiveRowColumnItem(
          rowFit: FlexFit.tight,
          child: _getTextField(addAddressBloc, AddAddressFieldsTypes.values[8]),
        ),
      ],
    );
  }
}
