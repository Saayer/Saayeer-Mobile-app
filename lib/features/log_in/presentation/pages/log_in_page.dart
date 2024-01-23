import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/current_user/logged_in_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';
import 'package:saayer/common/app_bar_widget.dart';
import 'package:saayer/common/loading_widget.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/password_text_field.dart';
import 'package:saayer/common/toast_widget.dart';
import 'package:saayer/common/buttons_widget.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocConsumer<LogInBloc, LogInState>(
      buildWhen: (previousState, nextState) =>
          (previousState.requestState != nextState.requestState),
      listener: (context, state) async {
        if (state.logInSuccessfully) {
          await getIt<SecureStorageService>()
              .setIsLoggedIn(state.submitLogInEntity!.isSuccess!);
          await getIt<SecureStorageService>()
              .setLoggedInUser(state.submitLogInEntity!.loggedInUserEntity!);
          getIt<LoggedInService>().setLoggedInUserEntity(
              state.submitLogInEntity!.loggedInUserEntity!);
          final String firstName =
              state.submitLogInEntity!.loggedInUserEntity!.name.split(" ")[0];
          //showToast(msg: ToastMessages.login(firstName));
          getIt<NavigationService>().navigateAndFinish(const ViewPageScreen());
        }
        if (state.requestState == RequestState.ERROR) {
          showToast(msg: state.errorMessage ?? "");
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarWidget(
          title: "${Constants.appName} Login",
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Form(
                  autovalidateMode: state.autoValidateMode,
                  key: BlocProvider.of<LogInBloc>(context).formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: height / 40,
                        ),
                        const EmailTextField(),
                        SizedBox(
                          height: height / 40,
                        ),
                        const PasswordTextField(),
                        SizedBox(
                          height: height / 20,
                        ),
                        // Text(
                        //   'Forget Password ?',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: SaayerTheme().getColorsPalette().blackTextColor,
                        //     fontWeight: FontWeight.bold,
                        //     fontStyle: FontStyle.normal,
                        //     decoration: TextDecoration.underline,
                        //   ),
                        // ),
                        SizedBox(
                          height: height / 15,
                        ),
                        TxtButton(
                          text: "Log In",
                          color: enableLogIn(context)
                              ? SaayerTheme().getColorsPalette().orangeColor
                              : Colors.grey,
                          borderRadius: 50,
                          onPressed: () {
                            enableLogIn(context)
                                ? BlocProvider.of<LogInBloc>(context)
                                    .add(LogIn())
                                : showToast(
                                    msg: "Please, fill out all the fields");
                          },
                          btnWidth: width / 1.2,
                          btnHeight: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                if (BlocProvider.of<LogInBloc>(context).state.requestState ==
                    RequestState.LOADING)
                  Container(
                    width: width,
                    height: height,
                    color: SaayerTheme().getColorsPalette().lightGreyColor.withOpacity(.3),
                    child: const ShowLoading(
                      isLoading: true,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool enableLogIn(context) {
    return BlocProvider.of<LogInBloc>(context)
            .emailController
            .text
            .isNotEmpty &&
        BlocProvider.of<LogInBloc>(context).passwordController.text.isNotEmpty;
  }
}
