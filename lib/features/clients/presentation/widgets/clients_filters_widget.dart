import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/generic_expansionTile_widget.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/clients/core/utils/enums/enums.dart';
import 'package:saayer/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:saayer/features/clients/presentation/widgets/clients_filter_widget_helper.dart';

class ClientsFiltersWidget extends StatefulWidget {
  final ClientsBloc clientsBloc;

  const ClientsFiltersWidget({
    super.key,
    required this.clientsBloc,
  });

  @override
  State<ClientsFiltersWidget> createState() => _AdminShipmentsFiltersWidgetState();
}

class _AdminShipmentsFiltersWidgetState extends State<ClientsFiltersWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: GenericExpansionTileWidget(
          title: 'search'.tr(),
          selectedFilterCount: _getCountOfSelectedFilter(),
          iconPath: Constants.getIconPath('ic_filter.svg'),
          iconColor: SaayerTheme().getColorsPalette.primaryColor,
          children: [
            ///
            ResponsiveRowColumn(
              layout: ResponsiveValue(context,
                      conditionalValues: [const Condition.equals(name: DESKTOP, value: ResponsiveRowColumnType.ROW)],
                      defaultValue: ResponsiveRowColumnType.COLUMN)
                  .value,
              columnVerticalDirection: VerticalDirection.down,
              columnSpacing: 5,
              rowSpacing: 10,
              children: [
                ResponsiveRowColumnItem(
                  rowFit: FlexFit.loose,

                  /// Search By Text & Search by Clients Phone
                  child: _buildFirstFiltersRow(),
                ),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,

                    /// Search By Total Shipments (min - max)
                    child: _buildSecondFiltersRow())
              ],
            ),
            const SizedBox(height: 10),

            ///Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///reset filter
                MaterialButton(
                  onPressed: () {
                    _resetFilter();
                  },
                  height: 50,
                  minWidth: 90,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: SaayerTheme().getColorsPalette.primaryColor),
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GenericSvgWidget(
                      path: Constants.getIconPath('ic_clear_filter.svg'),
                      size: 30,
                      color: SaayerTheme().getColorsPalette.primaryColor),
                ),
                const SizedBox(width: 8),
                SaayerDefaultTextButton(
                    text: 'search'.tr(),
                    isEnabled: true,
                    borderRadius: 16,
                    onPressed: () {
                      final bool isFormValid = (formKey.currentState!.validate());
                      if (isFormValid) {
                        widget.clientsBloc.add(const ResetClientsList());
                        widget.clientsBloc.add(const GetClientsListByFilter());
                      }
                    },
                    btnWidth: 90,
                    btnHeight: 50),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }

  _buildFirstFiltersRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ClientsFilterWidgetHelper(
                  clientsBloc: widget.clientsBloc, clientsFilterTypes: ClientsFilterTypes.values[0])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClientsFilterWidgetHelper(
                  clientsBloc: widget.clientsBloc, clientsFilterTypes: ClientsFilterTypes.values[1])
              .getFilterItem(context),
        ),
      ],
    );
  }

  _buildSecondFiltersRow() {
    return Row(
      children: [
        Expanded(
          child: ClientsFilterWidgetHelper(
                  clientsBloc: widget.clientsBloc, clientsFilterTypes: ClientsFilterTypes.values[2])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClientsFilterWidgetHelper(
                  clientsBloc: widget.clientsBloc, clientsFilterTypes: ClientsFilterTypes.values[3])
              .getFilterItem(context),
        )
      ],
    );
  }

  void _resetFilter() {
    widget.clientsBloc.clientsSearchController.clear();
    widget.clientsBloc.clientPhoneController.clear();
    widget.clientsBloc.clientsTotalShipmentMinController.clear();
    widget.clientsBloc.clientsTotalShipmentMaxController.clear();
    widget.clientsBloc.mobile = PhoneNumber(isoCode: 'SA', dialCode: '+966');

    setState(() {});
  }

  String? _getCountOfSelectedFilter() {
    int count = 0;
    if (widget.clientsBloc.clientsSearchController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.clientsBloc.clientPhoneController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.clientsBloc.clientsTotalShipmentMinController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.clientsBloc.clientsTotalShipmentMaxController.text.isNotEmpty) {
      count = count + 1;
    }
    return count == 0 ? '' : count.toString();
  }
}
