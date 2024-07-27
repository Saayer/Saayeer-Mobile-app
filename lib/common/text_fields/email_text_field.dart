import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final void Function(String)? onChanged;

  const EmailTextField(
      {super.key, required this.emailController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelTxt(txt: "email".tr()),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 8, right: 16, left: 16),
          child: BaseTextField(
            controller: emailController,
            hintText: "email".tr(),
            validator: null,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
