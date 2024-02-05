import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/personal_info/core/errors/personal_info_error_handler.dart';
import 'package:saayer/features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'dart:ui' as ui;
import 'package:saayer/features/verify_otp/presentation/screens/verify_otp_screen.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final PersonalInfoBloc personalInfoBloc =
        BlocProvider.of<PersonalInfoBloc>(context);

    return BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (personalInfoBloc.state.stateHelper.requestState ==
                RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            SaayerToast().showSuccessToast(
                msg: state.submitPersonalInfoEntity?.message ?? "");
            getIt<NavigationService>().navigateTo(VerifyOtpScreen(
              verifyOtpEntity: VerifyOtpEntity(
                  phoneNumber:
                      state.personalInfoEntity?.phoneNumber.phoneNumber ?? "",
                  otp: state.submitPersonalInfoEntity?.otp ?? ""),
            ));
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            PersonalInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: const BaseAppBar(
            showBackLeading: false,
          ),
          bottomSheet: ColoredBox(
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: SaayerDefaultTextButton(
                text: "log_in",
                isEnabled: enablePersonalInfo(personalInfoBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid =
                      (personalInfoBloc.formKey.currentState!.validate());
                  isFormValid
                      ? personalInfoBloc.add(SubmitPersonalInfoData())
                      : SaayerToast()
                          .showErrorToast(msg: "empty_fields_error".tr());
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
                    key: personalInfoBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        LabelTxt(txt: "phone_num".tr()),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "enter_phone_num_desc".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.highlightedLabel(),
                              ),
                            ],
                          ),
                        ),
                        ...(PersonalInfoFieldsTypes.values
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 20.h),
                                  child: InputTextField(
                                    label: e.name.toLowerCase(),
                                    inputController: _getInputController(
                                        personalInfoBloc, e),
                                  ),
                                ))
                            .toList())
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

  TextEditingController _getInputController(PersonalInfoBloc personalInfoBloc,
      PersonalInfoFieldsTypes personalInfoFieldsType) {
    switch (personalInfoFieldsType) {
      case PersonalInfoFieldsTypes.NAME:
        {
          return personalInfoBloc.nameController;
        }
      case PersonalInfoFieldsTypes.EMAIL:
        {
          return personalInfoBloc.emailController;
        }
      case PersonalInfoFieldsTypes.NATIONAL_ID:
        {
          return personalInfoBloc.nationalIDController;
        }
      case PersonalInfoFieldsTypes.ADDRESS:
        {
          return personalInfoBloc.addressController;
        }
      case PersonalInfoFieldsTypes.DISTRICT:
        {
          return personalInfoBloc.districtController;
        }
      case PersonalInfoFieldsTypes.GOVERNORATE:
        {
          return personalInfoBloc.governorateController;
        }
    }
  }

  bool enablePersonalInfo(PersonalInfoBloc personalInfoBloc) {
    log("${personalInfoBloc.personalInfoFieldsValidMap}",
        name: "enablePersonalInfo --->");
    if (personalInfoBloc.personalInfoFieldsValidMap.values.length == 1) {
      return personalInfoBloc.personalInfoFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
