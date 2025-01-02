import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/core/errors/saayer_gain_error_handler.dart';
import 'package:saayer/features/more_sub_features/admin_saayer_gain/presentation/bloc/saayer_gain_bloc.dart';

class SaayerGainPage extends StatefulWidget {
  const SaayerGainPage({super.key});

  @override
  State<SaayerGainPage> createState() => _SaayerGainPageState();
}

class _SaayerGainPageState extends State<SaayerGainPage> {
  @override
  Widget build(BuildContext context) {
    final SaayerGainBloc saayerGainBloc = BlocProvider.of<SaayerGainBloc>(context);
    return BlocConsumer<SaayerGainBloc, SaayerGainState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            getIt<NavigationService>().pop();
            SaayerToast().showSuccessToast(msg: "saayer_gain_change_successfully".tr());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            SaayerGainErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        appBar: const BaseAppBar(title: 'saayer_gain', showBackLeading: true),
        bottomSheet: _buildConfirmButton(saayerGainBloc),
        body: Form(
          key: saayerGainBloc.formKey,
          autovalidateMode: state.autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "${'saayer_gain'.tr()} :",
                  style: AppTextStyles.boldLabel(SaayerTheme().getColorsPalette.blackColor),
                ),
                const SizedBox(height: 20),
                _buildSaayerGainPercentageWidget(saayerGainBloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSaayerGainPercentageWidget(SaayerGainBloc saayerGainBloc) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (saayerGainBloc.saayerGainPercentage <= 99) {
                    saayerGainBloc
                        .add(OnChangeSaayerGainPercentage(saayerGain: saayerGainBloc.saayerGainPercentage + 1));
                  }
                  setState(() {});
                },
                icon: Icon(
                  Icons.arrow_drop_up,
                  size: 30,
                  color: SaayerTheme().getColorsPalette.blackColor,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 50,
                child: BaseTextField(
                  fillColor: SaayerTheme().getColorsPalette.whiteColor,
                  maxLines: 1,
                  maxLength: 3,
                  textAlign: TextAlign.center,
                  enabledBorderColor: SaayerTheme().getColorsPalette.whiteColor,
                  controller: saayerGainBloc.saayerGainController
                    ..addListener(() {
                      if (saayerGainBloc.saayerGainController.text.isNotEmpty) {
                        saayerGainBloc.saayerGainPercentage = int.parse(saayerGainBloc.saayerGainController.text);
                        setState(() {});
                      }
                    }),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'empty_field_error'.tr().replaceFirst("{}", '');
                    } else if (value?.isNotEmpty ?? true) {
                      if (int.parse(value ?? '') >= 101) {
                        return 'error'.tr();
                      } else if (int.parse(value ?? '') <= -1) {
                        return 'error'.tr();
                      }
                    }
                    return null;
                  },
                  borderRadius: 10.0,
                  onChanged: (value) {},
                  hintText: '',
                ),
              ),
              Text(
                ' % ',
                style: AppTextStyles.mainLabel(SaayerTheme().getColorsPalette.blackColor),
              ),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    if (saayerGainBloc.saayerGainPercentage >= 1) {
                      saayerGainBloc
                          .add(OnChangeSaayerGainPercentage(saayerGain: saayerGainBloc.saayerGainPercentage - 1));
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: SaayerTheme().getColorsPalette.blackColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _buildConfirmButton(SaayerGainBloc saayerGainBloc) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "save",
        isEnabled: _isEnabled(saayerGainBloc),
        borderRadius: 16,
        onPressed: !_isEnabled(saayerGainBloc)
            ? null
            : () {
                final bool isFormValid = (saayerGainBloc.formKey.currentState!.validate());
                isFormValid
                    ? saayerGainBloc.add(UpdateSaayerGain(
                        gainRatioPost: GainRatioPost((b) =>
                            b..newGainRatio = double.tryParse((saayerGainBloc.saayerGainPercentage / 100).toString()))))
                    : (saayerGainBloc.saayerGainPercentage >= 101)
                        ? SaayerToast().showErrorToast(msg: "saayer_gain_max_percentage_error".tr())
                        : (saayerGainBloc.saayerGainPercentage <= -1)
                            ? SaayerToast().showErrorToast(msg: "saayer_gain_min_percentage_error".tr())
                            : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
              },
      ),
    );
  }

  bool _isEnabled(SaayerGainBloc saayerGainBloc) {
    if (saayerGainBloc.state.saayerGainPercentage == saayerGainBloc.saayerGainPercentage) {
      return false;
    } else {
      return true;
    }
  }
}
