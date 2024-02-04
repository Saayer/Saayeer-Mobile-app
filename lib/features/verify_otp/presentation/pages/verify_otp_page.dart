import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/verify_otp/core/errors/verify_otp_error_handler.dart';
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart';
import 'dart:ui' as ui;

import 'package:saayer/features/verify_otp/presentation/widgets/down_bill_timer_counter_widget.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final VerifyOtpBloc verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);

    final otpFieldStyles =
        List.generate(4, (index) => AppTextStyles.buttonLabel());

    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (verifyOtpBloc.state.stateHelper.requestState ==
            RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            SaayerToast().showSuccessToast(
                msg: state.submitVerifyOtpEntity?.message ?? "");
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            VerifyOtpErrorHandler(state: state)();
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
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: SaayerTheme().getColorsPalette.backgroundColor,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "verify_otp".tr(),
                              textAlign: TextAlign.start,
                              style: AppTextStyles.highlightedLabel(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "verify_otp_desc".tr(),
                              textAlign: TextAlign.start,
                              style: AppTextStyles.paragraph(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 20.h),
                        child: Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: OtpTextField(
                            numberOfFields: 4,
                            clearText: true,
                            borderColor:
                                SaayerTheme().getColorsPalette.greyColor,
                            focusedBorderColor:
                                SaayerTheme().getColorsPalette.blackTextColor,
                            styles: otpFieldStyles,
                            showFieldAsBox: false,
                            borderWidth: 4.0,
                            onCodeChanged: (String code) {
                              //handle validation or checks here if necessary
                            },
                            onSubmit: (String verificationCode) {
                              verifyOtpBloc
                                  .add(CheckOtpEvent(otp: verificationCode));
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const DownBillTimerCounterWidget()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
