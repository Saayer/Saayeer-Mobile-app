import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
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
import 'dart:ui' as ui;

import 'package:saayer/features/verify_otp/presentation/screens/verify_otp_screen.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final LogInBloc logInBloc = BlocProvider.of<LogInBloc>(context);

    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<LogInBloc, LogInState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) async {
          final bool isLoading = (logInBloc.state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {
              SaayerToast().showSuccessToast(msg:"code_sent".tr());
              getIt<NavigationService>().navigateTo(VerifyOtpScreen(
                  tokenRequestDto: TokenRequestDto((b) => b
                    ..phoneNumber = state.loginRequestDto?.phoneNo ?? ""
                    ..verificationCode = state.responseLogInEntity?.verificationCodeTemp ?? ""),
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
            bottomSheet: Container(
              width: width,
              //height: 100.h,
              color: SaayerTheme().getColorsPalette.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 16, right: 16, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SaayerDefaultTextButton(
                      text: "log_in",
                      isEnabled: enableLogIn(logInBloc),
                      borderRadius: 16,
                      onPressed: () {
                        final bool isFormValid = (logInBloc.formKey.currentState!.validate());
                        isFormValid
                            ? logInBloc.add(SubmitLogInData())
                            : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
                      },
                      btnWidth: width / 1.2,
                      btnHeight: 50,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        getIt<NavigationService>().navigateAndFinish(const ViewPageScreen());
                      },
                      child: Text(
                        "enter_as_guest".tr(),
                        style: AppTextStyles.boldLabel(SaayerTheme().getColorsPalette.blackTextColor),
                      ),
                    ),
                  ],
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
                      key: logInBloc.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          // LabelTxt(txt: "phone_num".tr()),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                            child: Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: PhoneTextField(
                                phoneNumController: logInBloc.phoneController,
                                onInputChanged: (PhoneNumber phoneNumber) {
                                  log("dialCode: ${phoneNumber.dialCode} - isoCode: ${phoneNumber.isoCode} - phoneNumber: ${phoneNumber.phoneNumber}",
                                      name: "onInputChanged --->");
                                  log("${phoneNumber.phoneNumber}-${phoneNumber.parseNumber()}",
                                      name: "PhoneTextField onInputChanged ->");
                                  logInBloc.add(OnTextChange(
                                      logInFieldsType: LogInFieldsTypes.PHONE_NUMBER,
                                      phoneNumber: phoneNumber,
                                      textEditingController: logInBloc.phoneController));
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
      ),
    );
  }

  bool enableLogIn(LogInBloc logInBloc) {
    log("${logInBloc.logInFieldsValidMap}", name: "enableLogIn --->");
    if (logInBloc.logInFieldsValidMap.values.length == 1) {
      return logInBloc.logInFieldsValidMap.values.every((element) => element == true);
    }
    return false;
  }
}
