import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/errors/store_info_error_handler.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/bloc/add_edit_store_bloc.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/widgets/store_info_text_field_helper.dart';

class AddEditStorePage extends StatefulWidget {
  final AddEditStoreType addEditStoreType;
  final StoreGetDto storeDto;

  const AddEditStorePage({
    super.key,
    required this.addEditStoreType,
    required this.storeDto,
  });

  @override
  State<AddEditStorePage> createState() => _AddEditStorePageState();
}

class _AddEditStorePageState extends State<AddEditStorePage> {
  ///
  GlobalKey zipCodeKey = GlobalKey<State<StatefulWidget>>();
  GlobalKey addressKey = GlobalKey<State<StatefulWidget>>();
  GlobalKey financialNoKey = GlobalKey<State<StatefulWidget>>();
  GlobalKey freelanceNoKey = GlobalKey<State<StatefulWidget>>();

  ///
  @override
  Widget build(BuildContext context) {
    final AddEditStoreBloc addEditStoreBloc = BlocProvider.of<AddEditStoreBloc>(context);

    return BlocConsumer<AddEditStoreBloc, AddEditStoreState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            getIt<NavigationService>().pop();
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            StoreInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
            title: widget.addEditStoreType == AddEditStoreType.editStore ? widget.storeDto.name : 'add_store'.tr(),
            showBackLeading: true),
        bottomSheet: _buildSubmitButtonWidget(addEditStoreBloc),
        body: _buildAddEditStoreFieldsWidget(addEditStoreBloc, state),
      ),
    );
  }

  Widget _getTextField(AddEditStoreBloc addEditStoreBloc, StoreInfoFieldsTypes storeInfoFieldsType) {
    return StoreInfoTextFieldHelper(addEditStoreBloc: addEditStoreBloc, storeInfoFieldsType: storeInfoFieldsType)
        .getTextField(
            zipCodeKey: zipCodeKey,
            addressKey: addressKey,
            financialNoKey: financialNoKey,
            freelanceNoKey: freelanceNoKey);
  }

  _buildSubmitButtonWidget(AddEditStoreBloc storeInfoBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "submit",
        isEnabled: enableAddress(storeInfoBloc),
        borderRadius: 16,
        onPressed: () {
          final bool isFormValid = (storeInfoBloc.formKey.currentState!.validate());
          storeInfoBloc.add(ToggleAutoValidate());
          isFormValid
              ? widget.addEditStoreType == AddEditStoreType.addStore
                  ? storeInfoBloc.add(SubmitStoreInfoData())
                  : storeInfoBloc.add(const OnUpdateStore())
              : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
        },
      ),
    );
  }

  bool enableAddress(AddEditStoreBloc storeInfoBloc) {
    if (storeInfoBloc.nameController.text.isNotEmpty &&
        (storeInfoBloc.mobile.phoneNumber != null) &&
        (storeInfoBloc.mobile.phoneNumber!.length > 13) &&
        storeInfoBloc.addressController.text.isNotEmpty &&
        (storeInfoBloc.selectedCountry != null) &&
        (storeInfoBloc.selectedGovernorate != null) &&
        (storeInfoBloc.selectedCity != null)) {
      return true;
    }
    return false;
  }

  _buildAddEditStoreFieldsWidget(AddEditStoreBloc addEditStoreBloc, AddEditStoreState state) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: SaayerTheme().getColorsPalette.backgroundColor,
        child: Center(
          child: Form(
            autovalidateMode: state.autoValidateMode,
            key: addEditStoreBloc.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                /// storeName & PhoneNum & Country & Governorate
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
                    /// storeName & PhoneNum
                    _buildFirstColumnRowField(addEditStoreBloc),

                    /// Country & Governorate
                    _buildSecondColumnRowField(addEditStoreBloc),
                  ],
                ),
                const SizedBox(height: 10),

                /// City & addressDetails & zipCode & financialRecordNo
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
                    /// City & addressDetails
                    _buildThirdColumnRowField(addEditStoreBloc),

                    /// zipCode & financialRecordNo
                    _buildFourthColumnRowField(addEditStoreBloc),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                /// freelance certificate number
                _buildFifthColumnRowField(addEditStoreBloc),
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

  _buildFirstColumnRowField(AddEditStoreBloc addEditStoreBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.loose,
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
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[0]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[1]),
            ),
          ],
        ));
  }

  _buildSecondColumnRowField(AddEditStoreBloc addEditStoreBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.loose,
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
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[2]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[3]),
            ),
          ],
        ));
  }

  _buildThirdColumnRowField(AddEditStoreBloc addEditStoreBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.loose,
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
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[4]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[5]),
            ),
          ],
        ));
  }

  _buildFourthColumnRowField(AddEditStoreBloc addEditStoreBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.loose,
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
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[6]),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[7]),
            ),
          ],
        ));
  }

  _buildFifthColumnRowField(AddEditStoreBloc addEditStoreBloc) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.loose,
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
              rowFit: FlexFit.loose,
              child: _getTextField(addEditStoreBloc, StoreInfoFieldsTypes.values[8]),
            ),
          ],
        ));
  }
}
