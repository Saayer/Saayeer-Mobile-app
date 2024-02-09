import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/core/errors/personal_info_error_handler.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'dart:ui' as ui;

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final UserInfoViewPageBloc userInfoViewPageBloc =
        BlocProvider.of<UserInfoViewPageBloc>(context);
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
            userInfoViewPageBloc.add(GoToNextPageEvent());
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
          bottomSheet: Container(
            width: width,
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
              child: SaayerDefaultTextButton(
                text: "next",
                isEnabled: enablePersonalInfo(personalInfoBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid =
                      (personalInfoBloc.formKey.currentState!.validate());
                  personalInfoBloc.add(ToggleAutoValidate());
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "personal_info".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.sectionTitle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ...(PersonalInfoFieldsTypes.values.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 10.h),
                            child: _getTextField(personalInfoBloc, e),
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

  Widget _getTextField(PersonalInfoBloc personalInfoBloc,
      PersonalInfoFieldsTypes personalInfoFieldsType) {
    switch (personalInfoFieldsType) {
      case PersonalInfoFieldsTypes.EMAIL:
        {
          return EmailTextField(
            emailController:
                _getInputController(personalInfoBloc, personalInfoFieldsType),
            onChanged: (val) {
              personalInfoBloc.add(OnTextChange(
                  str: val,
                  personalInfoFieldsType: PersonalInfoFieldsTypes.EMAIL,
                  textEditingController: _getInputController(
                      personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
      default:
        {
          return InputTextField(
            label: personalInfoFieldsType.name.toLowerCase(),
            inputController:
                _getInputController(personalInfoBloc, personalInfoFieldsType),
            onChanged: (val) {
              personalInfoBloc.add(OnTextChange(
                  str: val,
                  personalInfoFieldsType: personalInfoFieldsType,
                  textEditingController: _getInputController(
                      personalInfoBloc, personalInfoFieldsType)));
            },
          );
        }
    }
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
    if (personalInfoBloc.personalInfoFieldsValidMap.values.length ==
        PersonalInfoFieldsTypes.values.length) {
      return personalInfoBloc.personalInfoFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
