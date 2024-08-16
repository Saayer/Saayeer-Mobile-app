import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_details/data/core/utils/enums.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/shipment_details/presentation/widgets/shipment_details_text_field_helper.dart';

class ShipmentDetailsPage extends StatefulWidget {
  const ShipmentDetailsPage({
    super.key,
  });

  @override
  State<ShipmentDetailsPage> createState() => _ShipmentDetailsPageState();
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  ///
  GlobalKey contentDescriptionKey = GlobalKey<State<StatefulWidget>>();
  GlobalKey contentValueKey = GlobalKey<State<StatefulWidget>>();

  ///
  @override
  Widget build(BuildContext context) {
    final RequestShipmentBloc requestShipmentBloc = BlocProvider.of<RequestShipmentBloc>(context);

    return BlocConsumer<RequestShipmentBloc, RequestShipmentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (requestShipmentBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: _buildShipmentDetailsBodyWidget(requestShipmentBloc),
          bottomSheet: _buildNextButtonWidget(requestShipmentBloc),
        );
      },
    );
  }

  _buildNextButtonWidget(RequestShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "next",
        isEnabled: enableButton(requestShipmentBloc),
        borderRadius: 16,
        onPressed: () {
          final bool isFormValid = (requestShipmentBloc.formKey.currentState!.validate());
          requestShipmentBloc.add(ToggleAutoValidate());
          isFormValid
              ? requestShipmentBloc.add(const GetServiceProviders())
              : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
        },
      ),
    );
  }

  _buildShipmentDetailsBodyWidget(RequestShipmentBloc requestShipmentBloc) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'shipment_details'.tr(),
                style: AppTextStyles.mainFocusedLabel(),
              ),
            ),
            const SizedBox(height: 10),
            _buildShipmentDetailsFieldsWidget(requestShipmentBloc),
          ],
        ),
      ),
    );
  }

  _buildShipmentDetailsFieldsWidget(RequestShipmentBloc requestShipmentBloc) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: SaayerTheme().getColorsPalette.backgroundColor,
        child: Form(
          autovalidateMode: requestShipmentBloc.state.autoValidateMode,
          key: requestShipmentBloc.formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              /// Length & Width & Height & Weight
              ResponsiveRowColumn(
                layout: ResponsiveValue(context,
                        conditionalValues: [
                          const Condition.largerThan(breakpoint: 900, value: ResponsiveRowColumnType.ROW)
                        ],
                        defaultValue: ResponsiveRowColumnType.COLUMN)
                    .value,
                columnVerticalDirection: VerticalDirection.down,
                columnMainAxisSize: MainAxisSize.min,
                columnSpacing: 10,
                rowSpacing: 15,
                children: [
                  /// Length & Width
                  _buildFirstColumnRowField(requestShipmentBloc),

                  /// Height & Weight
                  _buildSecondColumnRowField(requestShipmentBloc),
                ],
              ),
              const SizedBox(height: 10),

              /// Content Description & Content Value
              _buildThirdColumnRowField(requestShipmentBloc),
              const SizedBox(height: 10),
              Text('content_value_desc'.tr(), style: AppTextStyles.paragraph(SaayerTheme().getColorsPalette.greyColor)),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom + 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildFirstColumnRowField(RequestShipmentBloc requestShipmentBloc) {
    return ResponsiveRowColumnItem(
        child: ResponsiveRowColumn(
      layout: ResponsiveValue(context,
              conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
              defaultValue: ResponsiveRowColumnType.COLUMN)
          .value,
      columnVerticalDirection: VerticalDirection.down,
      columnMainAxisSize: MainAxisSize.min,
      columnSpacing: 10,
      rowSpacing: 15,
      children: [
        ResponsiveRowColumnItem(child: _getTextField(requestShipmentBloc, ShipmentDetailsFieldsTypes.values[0])),
        ResponsiveRowColumnItem(child: _getTextField(requestShipmentBloc, ShipmentDetailsFieldsTypes.values[1])),
      ],
    ));
  }

  _buildSecondColumnRowField(RequestShipmentBloc requestShipmentBloc) {
    return ResponsiveRowColumnItem(
        child: ResponsiveRowColumn(
      layout: ResponsiveValue(context,
              conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
              defaultValue: ResponsiveRowColumnType.COLUMN)
          .value,
      columnVerticalDirection: VerticalDirection.down,
      columnMainAxisSize: MainAxisSize.min,
      columnSpacing: 10,
      rowSpacing: 15,
      children: [
        ResponsiveRowColumnItem(child: _getTextField(requestShipmentBloc, ShipmentDetailsFieldsTypes.values[2])),
        ResponsiveRowColumnItem(child: _getTextField(requestShipmentBloc, ShipmentDetailsFieldsTypes.values[3])),
      ],
    ));
  }

  _buildThirdColumnRowField(RequestShipmentBloc requestShipmentBloc) {
    return ResponsiveRowColumnItem(
        child: ResponsiveRowColumn(
      layout: ResponsiveValue(context,
              conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
              defaultValue: ResponsiveRowColumnType.COLUMN)
          .value,
      columnVerticalDirection: VerticalDirection.down,
      columnMainAxisSize: MainAxisSize.min,
      columnSpacing: 10,
      rowSpacing: 15,
      children: [
        ResponsiveRowColumnItem(child: _getTextField(requestShipmentBloc, ShipmentDetailsFieldsTypes.values[4])),
        ResponsiveRowColumnItem(child: _getTextField(requestShipmentBloc, ShipmentDetailsFieldsTypes.values[5])),
      ],
    ));
  }

  _getTextField(RequestShipmentBloc requestShipmentBloc, ShipmentDetailsFieldsTypes type) {
    return ShipmentDetailsTextFieldHelper(requestShipmentBloc: requestShipmentBloc, shipmentDetailsFieldsTypes: type)
        .getTextField(contentDescriptionKey: contentDescriptionKey, contentValueKey: contentValueKey);
  }

  bool enableButton(RequestShipmentBloc requestShipmentBloc) {
    if (requestShipmentBloc.lengthController.text.isNotEmpty &&
        requestShipmentBloc.widthController.text.isNotEmpty &&
        (requestShipmentBloc.heightController.text.isNotEmpty) &&
        (requestShipmentBloc.weightController.text.isNotEmpty) &&
        (requestShipmentBloc.contentDescriptionController.text.isNotEmpty)) {
      return true;
    }
    return false;
  }
}
