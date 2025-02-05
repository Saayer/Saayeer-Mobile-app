import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/errors/business_info_error_handler.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/core/utils/enums/enums.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/bloc/business_info_bloc.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/widgets/business_info_text_field_helper.dart';

class BusinessInfoPage extends StatelessWidget {
  const BusinessInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final UserInfoViewPageBloc userInfoViewPageBloc = BlocProvider.of<UserInfoViewPageBloc>(context);
    final BusinessInfoBloc businessInfoBloc = BlocProvider.of<BusinessInfoBloc>(context);

    return BlocConsumer<BusinessInfoBloc, BusinessInfoState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) async {
          final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {
              userInfoViewPageBloc.add(GoToNextPageEvent());
            }
            if (state.stateHelper.requestState == RequestState.ERROR) {
              //showToast(msg: state.stateHelper.errorMessage ?? "");
              BusinessInfoErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
              bottomSheet: Container(
                width: width,
                color: SaayerTheme().getColorsPalette.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50, left: 16, right: 16, top: 20),
                  child: SaayerDefaultTextButton(
                    text: "next",
                    isEnabled: BusinessInfoTextFieldHelper.enableBusinessInfo(businessInfoBloc),
                    borderRadius: 16,
                    onPressed: () {
                      final bool isFormValid = (businessInfoBloc.formKey.currentState!.validate());
                      isFormValid
                          ? businessInfoBloc.add(SubmitBusinessInfoData())
                          : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
                    },
                    btnWidth: width / 1.2,
                    btnHeight: 50,
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
                        key: businessInfoBloc.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "business_info".tr(),
                                    textAlign: TextAlign.start,
                                    style: AppTextStyles.sectionTitle(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ...(BusinessInfoFieldsTypes.values
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                      child: BusinessInfoTextFieldHelper().getTextField(businessInfoBloc, e),
                                    ))
                                .toList()),
                            const SizedBox(
                              height: 150,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
