import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/generic_expansionTile_widget.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/widgets/admin/admin_shipments_filter_widget_helper.dart';

class AdminShipmentsFiltersWidget extends StatefulWidget {
  final ShipmentsBloc shipmentsBloc;

  const AdminShipmentsFiltersWidget({
    super.key,
    required this.shipmentsBloc,
  });

  @override
  State<AdminShipmentsFiltersWidget> createState() => _AdminShipmentsFiltersWidgetState();
}

class _AdminShipmentsFiltersWidgetState extends State<AdminShipmentsFiltersWidget> {
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

                  /// Search By Text & Search by Clients names
                  child: _buildFirstFiltersRow(),
                ),
                ResponsiveRowColumnItem(
                    rowFit: FlexFit.loose,

                    /// Search By Shipments (From - To) Date
                    child: _buildSecondFiltersRow())
              ],
            ),
            const SizedBox(height: 10),

            /// Search By Shipment Status & Search by Service Providers
            _buildThirdFiltersRow(),

            ///
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
                        widget.shipmentsBloc.add(const ResetAdminShipmentsList());
                        widget.shipmentsBloc.add(const GetAdminShipmentsList());
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
          child: AdminShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc, adminShipmentsFilterTypes: AdminShipmentsFilterTypes.values[0])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AdminShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc, adminShipmentsFilterTypes: AdminShipmentsFilterTypes.values[1])
              .getFilterItem(context),
        ),
      ],
    );
  }

  _buildSecondFiltersRow() {
    return Row(
      children: [
        Expanded(
          child: AdminShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc, adminShipmentsFilterTypes: AdminShipmentsFilterTypes.values[2])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AdminShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc, adminShipmentsFilterTypes: AdminShipmentsFilterTypes.values[3])
              .getFilterItem(context),
        )
      ],
    );
  }

  _buildThirdFiltersRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: AdminShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc, adminShipmentsFilterTypes: AdminShipmentsFilterTypes.values[4])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AdminShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc, adminShipmentsFilterTypes: AdminShipmentsFilterTypes.values[5])
              .getFilterItem(context),
        ),
      ],
    );
  }

  Future<DateTime?> showDate() async {
    DateTime now = DateTime.now();
    return await showDatePicker(context: context, firstDate: DateTime(2023), lastDate: now);
  }

  void _resetFilter() {
    widget.shipmentsBloc.adminSearchController.clear();
    widget.shipmentsBloc.adminShipmentDateFromController.clear();
    widget.shipmentsBloc.adminShipmentDateToController.clear();
    widget.shipmentsBloc.adminShipmentStatusController.clear();
    widget.shipmentsBloc.adminShipmentDateFrom = null;
    widget.shipmentsBloc.adminShipmentDateTo = null;
    widget.shipmentsBloc.selectedAdminShipmentStatus = null;
    widget.shipmentsBloc.selectedClientName = null;
    widget.shipmentsBloc.selectedAdminServiceProvider = null;

    setState(() {});
  }

  String? _getCountOfSelectedFilter() {
    int count = 0;
    if (widget.shipmentsBloc.adminSearchController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.shipmentsBloc.adminShipmentDateFromController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.shipmentsBloc.adminShipmentDateToController.text.isNotEmpty) {
      count = count + 1;
    }
    if (widget.shipmentsBloc.selectedAdminShipmentStatus != null) {
      count = count + 1;
    }
    if (widget.shipmentsBloc.selectedClientName != null) {
      count = count + 1;
    }
    if (widget.shipmentsBloc.selectedAdminServiceProvider != null) {
      count = count + 1;
    }
    return count == 0 ? '' : count.toString();
  }
}
