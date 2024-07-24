import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_address/core/errors/add_address_error_handler.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/add_address/presentation/bloc/add_address_bloc.dart';
import 'package:saayer/features/address/add_address/presentation/widgets/address_text_field_helper.dart';
import 'package:saayer/features/user_card/domain/entities/user_card_entity.dart';

class AddAddressPage extends StatefulWidget {
  final bool isAddShipmentRequest;

  final void Function(AddressInfoEntity)? onBack;

  const AddAddressPage({
    super.key,
    required this.isAddShipmentRequest,
    this.onBack,
  });

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  String address = '';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final AddAddressBloc addAddressBloc = BlocProvider.of<AddAddressBloc>(context);
    getUserCity();
    return BlocConsumer<AddAddressBloc, AddAddressState>(
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
          bottomSheet: Container(
            width: width,
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
              child: SaayerDefaultTextButton(
                text: "confirm",
                isEnabled: enableAddress(addAddressBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid = (addAddressBloc.formKey.currentState!.validate());
                  addAddressBloc.add(ToggleAutoValidate());
                  isFormValid
                      ? addAddressBloc.add(SubmitAddressData())
                      : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
                },
                btnWidth: width / 1.2,
                btnHeight: 50.h,
              ),
            ),
          ),
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: SaayerTheme().getColorsPalette.backgroundColor,
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    autovalidateMode: state.autoValidateMode,
                    key: addAddressBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        widget.isAddShipmentRequest
                            ? Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'sender_city'.tr(),
                                        style: AppTextStyles.label(SaayerTheme().getColorsPalette.greyColor)),
                                    TextSpan(text: address.tr(), style: AppTextStyles.boldLabel()),
                                  ],
                                ),
                              )
                            : Container(),
                        ...(AddAddressFieldsTypes.values.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
                            child: _getTextField(addAddressBloc, e),
                          );
                        }).toList()),
                        SizedBox(
                          height: 150.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTextField(AddAddressBloc addAddressBloc, AddAddressFieldsTypes addAddressFieldsType) {
    return AddressTextFieldHelper(
        addAddressBloc: addAddressBloc,
        addAddressFieldsType: addAddressFieldsType)
        .getTextField();
  }

  bool enableAddress(AddAddressBloc addAddressBloc) {
    // log("${addAddressBloc.addAddressFieldsValidMap}",
    //     name: "enableAddress --->");
    if (addAddressBloc.addAddressFieldsValidMap.values.length == AddAddressFieldsTypes.values.length) {
      return addAddressBloc.addAddressFieldsValidMap.values.every((element) => element == true);
    }
    return false;
  }

  getUserCity() async {
    final UserCardEntity? userCardEntity = await SecureStorageService().getUserCardInfo();

    if (userCardEntity != null) {
      setState(() {
        address = userCardEntity.personalInfoEntity!.address;
      });
    }
  }
}
