import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/helpers/utils_helper/validation_utils.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            const LabelTxt(txt: "E-mail"),
            Container(
              margin: EdgeInsets.only(top: 8.h, right: 20.w, left: 20.w),
              child: BaseTextField(
                controller: BlocProvider.of<LogInBloc>(context).emailController,
                hintText: "Email",
                validator: (value) {
                  if (ValidationUtils.isValidEmail(value ?? "")) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onChanged: (String str) {
                  BlocProvider.of<LogInBloc>(context).add(OnTextChange(
                      textEditingController:
                          BlocProvider.of<LogInBloc>(context).emailController,
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
