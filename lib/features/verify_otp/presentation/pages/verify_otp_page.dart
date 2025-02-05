import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/shared_pref_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
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
    final VerifyOtpBloc verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);

    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) async {
          final bool isLoading = (verifyOtpBloc.state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {
              if (state.isVerified) {
                SaayerToast().showSuccessToast(msg: "welcome".tr());
                await getIt<SharedPrefService>().setIsLoggedIn(true);
                getIt<NavigationService>().navigateAndFinishNamed(Routes.viewPageNamedPage);
              } else {
                SaayerToast().showSuccessToast(msg: 'invalid_otp_error_description'.tr());
              }
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
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "verify_otp".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.highlightedLabel(),
                              ),
                              const SizedBox(
                                height: 10,
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
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: SizedBox(
                              width: equalToMobile(context)
                                  ? width / 1.3
                                  : equalToTablet(context)
                                      ? width / 1.8
                                      : largerThanTablet(context)
                                          ? width / 2
                                          : width / 1.3,
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: AppTextStyles.buttonLabel(),
                                length: 6,
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  return null;

                                  // if (v!.length < 3) {
                                  //   return "I'm from validator";
                                  // } else {
                                  //   return null;
                                  // }
                                },
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  inactiveColor: SaayerTheme().getColorsPalette.blackTextColor,
                                  activeColor: SaayerTheme().getColorsPalette.greyColor,
                                  selectedColor: SaayerTheme().getColorsPalette.orangeColor,
                                  selectedFillColor: SaayerTheme().getColorsPalette.blackTextColor,
                                  activeFillColor: SaayerTheme().getColorsPalette.blackTextColor,
                                ),
                                cursorColor: SaayerTheme().getColorsPalette.blackTextColor,
                                animationDuration: const Duration(milliseconds: 300),
                                enableActiveFill: false,
                                keyboardType: TextInputType.number,
                                boxShadows: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (value) {
                                  debugPrint("Completed");
                                  verifyOtpBloc.add(CheckOtpEvent(otp: value));
                                },
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                                beforeTextPaste: (text) {
                                  debugPrint("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
      ),
    );
  }
}
