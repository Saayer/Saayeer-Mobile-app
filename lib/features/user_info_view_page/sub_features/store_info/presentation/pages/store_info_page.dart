import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/email_text_field.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/core/errors/store_info_error_handler.dart';
import 'package:saayer/features/user_info_view_page/sub_features/store_info/core/utils/enums/enums.dart';
import 'dart:ui' as ui;
import 'package:saayer/features/user_info_view_page/sub_features/store_info/presentation/bloc/store_info_bloc.dart';

class StoreInfoPage extends StatelessWidget {
  const StoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final StoreInfoBloc storeInfoBloc = BlocProvider.of<StoreInfoBloc>(context);

    return BlocConsumer<StoreInfoBloc, StoreInfoState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (storeInfoBloc.state.stateHelper.requestState ==
            RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            getIt<UserInfoViewPageBloc>().add(GoToNextPageEvent());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            StoreInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          bottomSheet: ColoredBox(
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: SaayerDefaultTextButton(
                text: "submit",
                isEnabled: enableStoreInfo(storeInfoBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid =
                      (storeInfoBloc.formKey.currentState!.validate());
                  storeInfoBloc.add(ToggleAutoValidate());
                  isFormValid
                      ? storeInfoBloc.add(SubmitStoreInfoData())
                      : SaayerToast()
                          .showErrorToast(msg: "empty_fields_error".tr());
                },
                btnWidth: width / 1.2,
                btnHeight: 50.h,
              ),
            ),
          ),
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: SaayerTheme().getColorsPalette.backgroundColor,
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    autovalidateMode: state.autoValidateMode,
                    key: storeInfoBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "store_info".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.highlightedLabel(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ...(StoreInfoFieldsTypes.values.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: _getTextField(storeInfoBloc, e),
                          );
                        }).toList()),
                        SizedBox(
                          height: 150.h,
                        ),
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

  Widget _getTextField(
      StoreInfoBloc storeInfoBloc, StoreInfoFieldsTypes storeInfoFieldsType) {
    switch (storeInfoFieldsType) {
      default:
        {
          return InputTextField(
            label: storeInfoFieldsType.name.toLowerCase(),
            inputController:
                _getInputController(storeInfoBloc, storeInfoFieldsType),
            onChanged: (val) {
              storeInfoBloc.add(OnTextChange(
                  str: val,
                  storeInfoFieldsType: storeInfoFieldsType,
                  textEditingController:
                      _getInputController(storeInfoBloc, storeInfoFieldsType)));
            },
          );
        }
    }
  }

  TextEditingController _getInputController(
      StoreInfoBloc storeInfoBloc, StoreInfoFieldsTypes storeInfoFieldsType) {
    switch (storeInfoFieldsType) {
      case StoreInfoFieldsTypes.NAME:
        {
          return storeInfoBloc.nameController;
        }
      case StoreInfoFieldsTypes.URL:
        {
          return storeInfoBloc.urlController;
        }
      case StoreInfoFieldsTypes.MAROOF_ID:
        {
          return storeInfoBloc.maroofIdController;
        }
      case StoreInfoFieldsTypes.COMMERCIAL_REGISTERATION_NO:
        {
          return storeInfoBloc.commercialRegistrationNoController;
        }
    }
  }

  bool enableStoreInfo(StoreInfoBloc storeInfoBloc) {
    log("${storeInfoBloc.storeInfoFieldsValidMap}",
        name: "enableStoreInfo --->");
    if (storeInfoBloc.storeInfoFieldsValidMap.values.length ==
        StoreInfoFieldsTypes.values.length) {
      return storeInfoBloc.storeInfoFieldsValidMap.values
          .every((element) => element == true);
    }
    return false;
  }
}
