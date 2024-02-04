import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/log_in/core/errors/log_in_error_handler.dart';
import 'package:saayer/features/log_in/core/utils/enums/enums.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'dart:ui' as ui;

import 'package:saayer/features/verify_otp/presentation/screens/verify_otp_screen.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final LogInBloc logInBloc = BlocProvider.of<LogInBloc>(context);

    return BlocConsumer<LogInBloc, LogInState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (logInBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            SaayerToast()
                .showSuccessToast(msg: state.submitLogInEntity?.message ?? "");
            getIt<NavigationService>().navigateTo(VerifyOtpScreen(
              verifyOtpEntity: VerifyOtpEntity(
                  phoneNumber: state.logInEntity?.phoneNumber.phoneNumber ?? "",
                  otp: state.submitLogInEntity?.otp ?? ""),
            ));
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            LogInErrorHandler(state: state)();
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
          bottomSheet: Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Row(
              children: [
                SaayerDefaultTextButton(
                  text: "log_in",
                  isEnabled: enableLogIn(logInBloc),
                  borderRadius: 50.r,
                  onPressed: () {
                    final bool isFormValid =
                        (logInBloc.formKey.currentState!.validate());
                    isFormValid
                        ? logInBloc.add(SubmitLogInData())
                        : SaayerToast()
                            .showErrorToast(msg: "empty_fields_error".tr());
                  },
                  btnWidth: width / 1.2,
                  btnHeight: 50.h,
                ),
              ],
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
                    key: logInBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        // LabelTxt(txt: "phone_num".tr()),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 20.h),
                          child: Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: PhoneTextField(
                              phoneNumController: logInBloc.phoneController,
                              onInputChanged: (PhoneNumber phoneNumber) {
                                log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                                    name: "onInputChanged --->");
                                log("${phoneNumber.phoneNumber}",
                                    name: "PhoneTextField onInputChanged ->");
                                logInBloc.add(OnTextChange(
                                    logInFieldsType:
                                        LogInFieldsTypes.PHONE_NUMBER,
                                    phoneNumber: phoneNumber,
                                    textEditingController:
                                        logInBloc.phoneController));
                              },
                            ),
                          ),
                        )
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

  bool enableLogIn(LogInBloc logInBloc) {
    log("${logInBloc.logInFieldsValidMap}", name: "enableLogIn --->");
    if (logInBloc.logInFieldsValidMap.values.length == 1) {
      return logInBloc.logInFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
