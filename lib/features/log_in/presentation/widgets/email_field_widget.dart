import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';
import 'package:saayer/shared_widgets/fields_widget.dart';
import 'package:saayer/shared_widgets/label_txt.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            LabelTxt(txt: "E-mail"),
            Container(
              margin: EdgeInsets.only(
                  top: 8.0, right: 20, left: 20),
              child: TxtField(
                controller:
                BlocProvider.of<LogInBloc>(context)
                    .emailController,
                hintText: "Email",
                validator: (value) {
                  if (value.toString().isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.toString()) ||
                      value == null) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onChanged: (String str) {
                  BlocProvider.of<LogInBloc>(context).add(
                      OnTextChange(
                          textEditingController:
                          BlocProvider.of<LogInBloc>(
                              context)
                              .emailController,
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
