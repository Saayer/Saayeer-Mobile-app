import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/core/utils/enums/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/bloc/shipment_specs_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_specs/presentation/widgets/shipment_specs_text_field_helper.dart';

class ShipmentSpecsPage extends StatelessWidget {
  const ShipmentSpecsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final ShipmentSpecsBloc shipmentSpecsBloc =
        BlocProvider.of<ShipmentSpecsBloc>(context);

    return BlocConsumer<ShipmentSpecsBloc, ShipmentSpecsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
//todo
            // userInfoViewPageBloc.add(GoToNextPageEvent());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {
            //showToast(msg: state.stateHelper.errorMessage ?? "");
            //todo
            // StoreInfoErrorHandler(state: state)();
          }
        }
      },
      builder: (context, state) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          bottomSheet: Container(
            width: width,
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
              child: SaayerDefaultTextButton(
                text: "submit",
                isEnabled: ShipmentSpecsTextFieldHelper.enableStoreInfo(
                    shipmentSpecsBloc),
                borderRadius: 16.r,
                onPressed: () {
                  final bool isFormValid =
                      (shipmentSpecsBloc.formKey.currentState!.validate());
                  shipmentSpecsBloc.add(ToggleAutoValidate());
                  isFormValid
                      ? shipmentSpecsBloc.add(SubmitShipmentSpecsInfoData())
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
                    key: shipmentSpecsBloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "shipment_details".tr(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.sectionTitle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ...(ShipmentSpecsFieldsTypes.values.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 10.h),
                            child: ShipmentSpecsTextFieldHelper()
                                .getTextField(shipmentSpecsBloc, e),
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
}
