import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/check_box_with_text_widget.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/errors/personal_info_error_handler.dart';
import 'package:saayer/features/more_sub_features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/bloc/personal_info_bloc.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/widgets/personal_info_text_field_helper.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  ///
  bool acceptedTerms = true;

  @override
  Widget build(BuildContext context) {
    final PersonalInfoBloc personalInfoBloc = BlocProvider.of<PersonalInfoBloc>(context);

    return BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            Navigator.pop(context);
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            PersonalInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: const BaseAppBar(
            title: 'personal_info',
            showBackLeading: true,
          ),
          bottomSheet: _buildSubmitButtonWidget(personalInfoBloc),
          body: _buildPersonalInfoFieldsWidget(personalInfoBloc, context, state),
        ),
      ),
    );
  }

  _buildSubmitButtonWidget(PersonalInfoBloc personalInfoBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "next",
        isEnabled: enableAddress(personalInfoBloc),
        borderRadius: 16,
        onPressed: () {
          final bool isFormValid = (personalInfoBloc.formKey.currentState!.validate());
          personalInfoBloc.add(ToggleAutoValidate());
          isFormValid
              ? acceptedTerms
                  ? personalInfoBloc.add(const EditClientData())
                  : SaayerToast().showErrorToast(msg: "please_accept_terms_condition".tr())
              : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
        },
      ),
    );
  }

  _buildPersonalInfoFieldsWidget(PersonalInfoBloc personalInfoBloc, BuildContext context, PersonalInfoState state) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: SaayerTheme().getColorsPalette.backgroundColor,
        child: Center(
          child: Form(
            autovalidateMode: state.autoValidateMode,
            key: personalInfoBloc.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),

                /// FullName & Phone & Email & BusinessName
                ResponsiveRowColumn(
                  layout: ResponsiveValue(context,
                          conditionalValues: [
                            const Condition.largerThan(breakpoint: 900, value: ResponsiveRowColumnType.ROW)
                          ],
                          defaultValue: ResponsiveRowColumnType.COLUMN)
                      .value,
                  columnVerticalDirection: VerticalDirection.down,
                  columnSpacing: 10,
                  rowSpacing: 15,
                  children: [
                    /// FullName & Phone
                    _buildFirstColumnRowField(personalInfoBloc, context),

                    /// Email & Address
                    _buildSecondColumnRowField(personalInfoBloc, context),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                /// BusinessName
                ResponsiveRowColumnItem(
                  child: PersonalInfoTextFieldHelper(
                          personalInfoBloc: personalInfoBloc,
                          personalInfoFieldsType: PersonalInfoFieldsTypes.BUSINESSNAME)
                      .getTextField(),
                ),
                const SizedBox(height: 10),
                _buildAcceptTermsConditionsMsg(),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom + 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFirstColumnRowField(PersonalInfoBloc personalInfoBloc, BuildContext context) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: PersonalInfoTextFieldHelper(
                      personalInfoBloc: personalInfoBloc, personalInfoFieldsType: PersonalInfoFieldsTypes.NAME)
                  .getTextField(),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: PersonalInfoTextFieldHelper(
                      personalInfoBloc: personalInfoBloc, personalInfoFieldsType: PersonalInfoFieldsTypes.PHONE)
                  .getTextField(),
            ),
          ],
        ));
  }

  _buildSecondColumnRowField(PersonalInfoBloc personalInfoBloc, BuildContext context) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: PersonalInfoTextFieldHelper(
                      personalInfoBloc: personalInfoBloc, personalInfoFieldsType: PersonalInfoFieldsTypes.EMAIL)
                  .getTextField(),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: PersonalInfoTextFieldHelper(
                      personalInfoBloc: personalInfoBloc, personalInfoFieldsType: PersonalInfoFieldsTypes.ADDRESS)
                  .getTextField(),
            ),
          ],
        ));
  }

  enableAddress(PersonalInfoBloc personalInfoBloc) {
    if (personalInfoBloc.nameController.text.isNotEmpty &&
        (personalInfoBloc.mobile.phoneNumber != null) &&
        personalInfoBloc.emailController.text.isNotEmpty &&
        personalInfoBloc.addressController.text.isNotEmpty &&
        acceptedTerms) {
      return true;
    }
    return false;
  }

  _buildAcceptTermsConditionsMsg() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: SaayerTheme().getColorsPalette.error0.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
        child: CheckBoxWithTextWidget(
          margin: EdgeInsets.zero,
          size: 20,
          isChecked: true,
          text: 'accept_terms_condition_msg'.tr(),
          onTap: (value) => {
            setState(() {
              acceptedTerms = value;
            })
          },
          widgets: [
            TextSpan(
                text: 'terms_conditions'.tr(),
                style: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.blueColor, 1.5),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ///
                    getIt<NavigationService>()
                        .navigateToNamed(Routes.staticPagesNamedPage, arguments: StaticPagesTypes.TERMSCONDITIONS);
                  })
          ],
        )
        // RichText(
        //     text: TextSpan(children: [
        //       TextSpan(text: 'accept_terms_condition_msg'.tr(), style: AppTextStyles.mainFocusedLabel(null, 1.5)),
        //       TextSpan(
        //           text: 'terms_conditions'.tr(),
        //           style: AppTextStyles.mainFocusedLabel(SaayerTheme().getColorsPalette.blueColor,1.5),
        //           recognizer: TapGestureRecognizer()
        //             ..onTap = () {
        //               ///
        //               getIt<NavigationService>()
        //                   .navigateToNamed(Routes.staticPagesNamedPage, arguments: StaticPagesTypes.TERMSCONDITIONS);
        //             })
        //     ])),
        );
  }
}
