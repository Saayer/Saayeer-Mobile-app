import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/common/text_fields/input_text_field_decoration.dart';
import 'package:saayer/core/helpers/utils_helper/validation_utils.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/log_in/presentation/bloc/log_in_bloc.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController phoneNumController;
  final void Function(PhoneNumber)? onInputChanged;

  const PhoneTextField(
      {super.key, required this.phoneNumController, this.onInputChanged});

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      locale: Localization.getLocale().languageCode,
      countries: const ['SA'],
      onInputChanged: (PhoneNumber number) {
        // log("dialCode: ${number.dialCode} - isoCode: ${number.isoCode} - phoneNumber: ${number.phoneNumber}",
        //     name: "onInputChanged --->");
        if (onInputChanged != null) {
          onInputChanged!(number);
        }
      },
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'empty_field_error'.tr().replaceFirst("{}", "phone_num".tr());
        }
        if (value!.length < 10) {
          return 'invalid_field_error'
              .tr()
              .replaceFirst("{}", "phone_num".tr());
        }
        return null;
      },
      onInputValidated: (bool value) {
        log("$value", name: "onInputValidated --->");
      },
      maxLength: 12,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        useBottomSheetSafeArea: true,
      ),
      ignoreBlank: false,
      hintText: "phone_num".tr(),
      errorMessage:
          'invalid_field_error'.tr().replaceFirst("{}", "phone_num".tr()),
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: AppTextStyles.liteLabel(),
      textStyle: AppTextStyles.liteLabel(),
      initialValue: PhoneNumber(isoCode: 'SA'),
      textFieldController: phoneNumController,
      formatInput: true,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputTextFieldDecoration()(),
      inputBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: SaayerTheme().getColorsPalette.greyColor, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      onSaved: (PhoneNumber number) {
        log('On Saved: $number');
      },
    );
  }
}
