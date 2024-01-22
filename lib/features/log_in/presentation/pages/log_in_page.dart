import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/current_user/logged_in_service.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/local_storage/secure_storage_service.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/app_strings.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/features/log_in/presentation/widgets/email_field_widget.dart';
import 'package:saayer/features/log_in/presentation/widgets/password_field_widget.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';
import 'package:saayer/shared_widgets/app_bar_widget.dart';
import 'package:saayer/shared_widgets/loading_widget.dart';
import 'package:saayer/shared_widgets/toast_widget.dart';
import 'package:saayer/core/utils/colors.dart';
import 'package:saayer/shared_widgets/buttons_widget.dart';

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
          getIt<NavigationService>().navigateAndFinish(ViewPageScreen());
        }
        if (state.requestState == RequestState.ERROR) {
          showToast(msg: state.errorMessage ?? "");
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(
          title: "${AppStrings.appName} Login",
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
                        EmailFieldWidget(),
                        SizedBox(
                          height: height / 40,
                        ),
                        PasswordFieldWidget(),
                        SizedBox(
                          height: height / 20,
                        ),
                        // Text(
                        //   'Forget Password ?',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: ColorsPalette.blackTextColor,
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
                              ? ColorsPalette.orangeColor
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
                    color: ColorsPalette.lightGreyColor.withOpacity(.3),
                    child: ShowLoading(
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
