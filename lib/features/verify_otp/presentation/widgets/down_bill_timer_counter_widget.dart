import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart';

DateTime? expiryDate = DateTime.now().add(const Duration(minutes: 2));

class DownBillTimerCounterWidget extends StatelessWidget {
  const DownBillTimerCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpBloc verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);

    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state.resetExpiryDate) {
          expiryDate = DateTime.now().add(const Duration(minutes: 2));
        }
        if (state.isOtpResent) {
          final String msg = Localization.translate("OTP_resend_msg");
          SaayerToast().showSuccessToast(msg: msg);
        }
      },
      builder: (context, state) {
        return expiryDate != null
            ? CountdownTimer(
                endTime: expiryDate!.millisecondsSinceEpoch,
                onEnd: () {},
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: time == null
                        ? [
                            GestureDetector(
                              onTap: () {
                                verifyOtpBloc.add(ResendOtpEvent());
                              },
                              child: Text(
                                Localization.translate("resend_code"),
                                style: AppTextStyles.label(SaayerTheme()
                                    .getColorsPalette
                                    .primaryColor),
                              ),
                            ),
                          ]
                        : [
                            Container(
                              height: 48,
                              alignment: Alignment.center,
                              child: Text(
                                Localization.translate("resend_code_in"),
                                style: AppTextStyles.label(),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${time.min != null ? time.min.toString().padLeft(2, "0") : '00'} : ${time.sec != null ? time.sec.toString().padLeft(2, "0") : '00'}",
                              style: AppTextStyles.buttonLabel(),
                              textDirection: TextDirection.ltr,
                            )
                          ],
                  );
                },
              )
            : const SizedBox();
      },
    );
  }
}
