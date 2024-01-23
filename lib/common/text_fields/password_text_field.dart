import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            const LabelTxt(txt: "Password"),
            Container(
              margin: EdgeInsets.only(top: 8.h, right: 20.w, left: 20.w),
              child: BaseTextField(
                controller:
                    BlocProvider.of<LogInBloc>(context).passwordController,
                hintText: "Password",
                validator: (value) {
                  // if (value.toString().isEmpty || value == null) {
                  //   return 'Password is empty!';
                  // } else if (value.length < 8 &&
                  //     !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])')
                  //         .hasMatch(value.toString())) {
                  //   // return 'Password must be at least 8 characters & \nPassword must have at least 1 lowercase letter\n'
                  //   //     'and 1 uppercase letter!';
                  //   return 'Password is invalid';
                  // } else if (value.length < 8) {
                  //   // return 'Password must be at least 8 characters!';
                  //   return 'Password is invalid';
                  // } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])')
                  //     .hasMatch(value.toString())) {
                  //   //r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
                  //   // return 'Password must have at least 1 lowercase letter\n'
                  //   //     ' and 1 uppercase letter!';
                  //   return 'Password is invalid';
                  // }
                  return null;
                },
                obscureText: state.obscurePassword,
                suffixWidget: GestureDetector(
                  onTap: () {
                    BlocProvider.of<LogInBloc>(context).add(TogglePassword());
                  },
                  child: state.obscurePassword
                      ? Icon(
                          Icons.visibility_off,
                          size: 20.r,
                          color: SaayerTheme().getColorsPalette().blackTextColor,
                        )
                      : Icon(
                          Icons.visibility,
                          size: 20.r,
                          color: SaayerTheme().getColorsPalette().blackTextColor,
                        ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (String str) {
                  BlocProvider.of<LogInBloc>(context).add(OnTextChange(
                      textEditingController: BlocProvider.of<LogInBloc>(context)
                          .passwordController,
                      str: str));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
