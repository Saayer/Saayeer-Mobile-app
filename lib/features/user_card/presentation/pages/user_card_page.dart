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
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/user_card/core/errors/user_card_error_handler.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';
import 'dart:ui' as ui;

import 'package:saayer/features/verify_otp/presentation/screens/verify_otp_screen.dart';

class UserCardPage extends StatelessWidget {
  const UserCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final UserCardBloc userCardBloc = BlocProvider.of<UserCardBloc>(context);

    return BlocConsumer<UserCardBloc, UserCardState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (userCardBloc.state.stateHelper.requestState ==
            RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            UserCardErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: false,
        child: Container(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
