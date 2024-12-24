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
import 'package:saayer/features/shipments/presentation/widgets/shipments_filter_widget_helper.dart';

class ShipmentsFiltersWidget extends StatefulWidget {
  final ShipmentsBloc shipmentsBloc;
  final ShipmentsListTypes shipmentsListType;

  const ShipmentsFiltersWidget({
    super.key,
    required this.shipmentsBloc,
    required this.shipmentsListType,
  });

  @override
  State<ShipmentsFiltersWidget> createState() => _ShipmentsFiltersWidgetState();
}

class _ShipmentsFiltersWidgetState extends State<ShipmentsFiltersWidget> {
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

                  /// Search By Text & Stores
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
                        if (widget.shipmentsListType == ShipmentsListTypes.IMPORT) {
                          widget.shipmentsBloc.add(const ResetImportShipmentsList());
                          widget.shipmentsBloc.add(const GetImportShipments());
                        } else {
                          widget.shipmentsBloc.add(const ResetExportShipmentsList());
                          widget.shipmentsBloc.add(const GetExportShipments());
                        }
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
          child: ShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListTypes: widget.shipmentsListType,
                  shipmentsFilterTypes: ShipmentsFilterTypes.values[0])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListTypes: widget.shipmentsListType,
                  shipmentsFilterTypes: ShipmentsFilterTypes.values[1])
              .getFilterItem(context),
        ),
      ],
    );
  }

  _buildSecondFiltersRow() {
    return Row(
      children: [
        Expanded(
          child: ShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListTypes: widget.shipmentsListType,
                  shipmentsFilterTypes: ShipmentsFilterTypes.values[2])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListTypes: widget.shipmentsListType,
                  shipmentsFilterTypes: ShipmentsFilterTypes.values[3])
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
          child: ShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListTypes: widget.shipmentsListType,
                  shipmentsFilterTypes: ShipmentsFilterTypes.values[4])
              .getFilterItem(context),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ShipmentsFilterWidgetHelper(
                  shipmentsBloc: widget.shipmentsBloc,
                  shipmentsListTypes: widget.shipmentsListType,
                  shipmentsFilterTypes: ShipmentsFilterTypes.values[5])
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
    if (widget.shipmentsListType == ShipmentsListTypes.EXPORT) {
      widget.shipmentsBloc.exportSearchController.clear();
      widget.shipmentsBloc.exportShipmentDateFromController.clear();
      widget.shipmentsBloc.exportShipmentDateToController.clear();
      widget.shipmentsBloc.exportShipmentStatusController.clear();
      widget.shipmentsBloc.exportShipmentDateFrom = null;
      widget.shipmentsBloc.exportShipmentDateTo = null;
      widget.shipmentsBloc.selectedExportShipmentStatus = null;
      widget.shipmentsBloc.selectedExportStore = null;
      widget.shipmentsBloc.selectedExportServiceProvider = null;
    } else {
      widget.shipmentsBloc.importSearchController.clear();
      widget.shipmentsBloc.importShipmentDateFromController.clear();
      widget.shipmentsBloc.importShipmentDateToController.clear();
      widget.shipmentsBloc.importShipmentStatusController.clear();
      widget.shipmentsBloc.importShipmentDateFrom = null;
      widget.shipmentsBloc.importShipmentDateTo = null;
      widget.shipmentsBloc.selectedImportShipmentStatus = null;
      widget.shipmentsBloc.selectedImportStore = null;
      widget.shipmentsBloc.selectedImportServiceProvider = null;
    }
    setState(() {});
  }

  String? _getCountOfSelectedFilter() {
    int count = 0;
    if (widget.shipmentsListType == ShipmentsListTypes.EXPORT) {
      if (widget.shipmentsBloc.exportSearchController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.exportShipmentDateFromController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.exportShipmentDateToController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.exportShipmentStatusController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.selectedExportShipmentStatus != null) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.selectedExportStore != null) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.selectedExportServiceProvider != null) {
        count = count + 1;
      }
    } else {
      if (widget.shipmentsBloc.importSearchController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.importShipmentDateFromController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.importShipmentDateToController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.importShipmentStatusController.text.isNotEmpty) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.selectedImportShipmentStatus != null) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.selectedImportStore != null) {
        count = count + 1;
      }
      if (widget.shipmentsBloc.selectedImportServiceProvider != null) {
        count = count + 1;
      }
    }
    return count == 0 ? '' : count.toString();
  }
}
