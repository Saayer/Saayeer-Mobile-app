import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/widgets/filter_item_drop_down_text_field.dart';

class ShipmentsFilterWidgetHelper {
  final ShipmentsFilterTypes shipmentsFilterTypes;
  final ShipmentsBloc shipmentsBloc;
  final ShipmentsListTypes shipmentsListTypes;

  ShipmentsFilterWidgetHelper({
    required this.shipmentsFilterTypes,
    required this.shipmentsBloc,
    required this.shipmentsListTypes,
  });

  getFilterItem(BuildContext context) {
    switch (shipmentsFilterTypes) {
      case ShipmentsFilterTypes.SEARCH:
        {
          return _getSearchTextField();
        }
      case ShipmentsFilterTypes.STORE:
        {
          return _getStoreTextField();
        }
      case ShipmentsFilterTypes.SELECT_DATE_FROM:
        {
          return _getDateFromTextField(context);
        }
      case ShipmentsFilterTypes.SELECT_DATE_TO:
        {
          return _getDateToTextField(context);
        }
      case ShipmentsFilterTypes.STATUS:
        {
          return _getStatusTextField();
        }
      case ShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return _getServiceProviderTextField();
        }
    }
  }

  TextEditingController _getInputController() {
    switch (shipmentsFilterTypes) {
      case ShipmentsFilterTypes.SEARCH:
        {
          return shipmentsListTypes == ShipmentsListTypes.EXPORT
              ? shipmentsBloc.exportSearchController
              : shipmentsBloc.importSearchController;
        }
      case ShipmentsFilterTypes.STORE:
        {
          return TextEditingController();
        }
      case ShipmentsFilterTypes.SELECT_DATE_FROM:
        {
          return shipmentsListTypes == ShipmentsListTypes.EXPORT
              ? shipmentsBloc.exportShipmentDateFromController
              : shipmentsBloc.importShipmentDateFromController;
        }
      case ShipmentsFilterTypes.SELECT_DATE_TO:
        {
          return shipmentsListTypes == ShipmentsListTypes.EXPORT
              ? shipmentsBloc.exportShipmentDateToController
              : shipmentsBloc.importShipmentDateToController;
        }
      case ShipmentsFilterTypes.STATUS:
        {
          return shipmentsListTypes == ShipmentsListTypes.EXPORT
              ? shipmentsBloc.exportShipmentStatusController
              : shipmentsBloc.importShipmentStatusController;
        }
      case ShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return TextEditingController();
        }
    }
  }

  _getSearchTextField() {
    return BaseTextField(
      hintText: shipmentsFilterTypes.name.tr(),
      controller: _getInputController(),
      onChanged: (val) {},
      validator: null,
      keyboardType: TextInputType.text,
    );
  }

  _getStoreTextField() {
    return FilterItemsDropDownTextField<StoreGetDto>(
      bloc: shipmentsBloc,
      shipmentsListTypes: shipmentsListTypes,
      hasLabel: false,
      withValidator: false,
      hasMargin: false,
      onSelected: (val) {
        shipmentsBloc.add(OnItemSelectedFromDropDown<StoreGetDto>(
          shipmentsFilterTypes: ShipmentsFilterTypes.STORE,
          item: val,
          shipmentsListTypes: shipmentsListTypes,
        ));
      },
      shipmentsFilterTypes: ShipmentsFilterTypes.STORE,
      selectedItem: shipmentsListTypes == ShipmentsListTypes.EXPORT
          ? shipmentsBloc.selectedExportStore
          : shipmentsBloc.selectedImportStore,
    );
  }

  _getDateFromTextField(BuildContext context) {
    return BaseTextField(
      hintText: shipmentsFilterTypes.name.tr(),
      controller: _getInputController(),
      isReadOnly: true,
      onTap: () async {
        DateTime? res = await showDate(context);
        if (shipmentsListTypes == ShipmentsListTypes.EXPORT) {
          shipmentsBloc.exportShipmentDateFromController.text = DateTimeUtil.dMyString(res);
          shipmentsBloc.exportShipmentDateFrom = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
        } else {
          shipmentsBloc.importShipmentDateFromController.text = DateTimeUtil.dMyString(res);
          shipmentsBloc.importShipmentDateFrom = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
        }
      },
      onChanged: (val) {},
      validator: null,
      keyboardType: TextInputType.text,
    );
  }

  _getDateToTextField(BuildContext context) {
    return BaseTextField(
      hintText: shipmentsFilterTypes.name.tr(),
      controller: _getInputController(),
      isReadOnly: true,
      onTap: () async {
        DateTime? res = await showDate(context);
        if (shipmentsListTypes == ShipmentsListTypes.EXPORT) {
          shipmentsBloc.exportShipmentDateToController.text = DateTimeUtil.dMyString(res);
          shipmentsBloc.exportShipmentDateTo = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
          if (shipmentsBloc.exportShipmentDateTo != null) {
            shipmentsBloc.exportShipmentDateTo =
                shipmentsBloc.exportShipmentDateTo!.add(DateTimeUtil.twentyThreeHoursAndFiftyNineMin);
          }
        } else {
          shipmentsBloc.importShipmentDateToController.text = DateTimeUtil.dMyString(res);
          shipmentsBloc.importShipmentDateTo = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
          if (shipmentsBloc.importShipmentDateTo != null) {
            shipmentsBloc.importShipmentDateTo =
                shipmentsBloc.importShipmentDateTo!.add(DateTimeUtil.twentyThreeHoursAndFiftyNineMin);
          }
        }
      },
      onChanged: (val) {},
      validator: (value) {
        if (value?.isNotEmpty ?? true) {
          if (shipmentsListTypes == ShipmentsListTypes.EXPORT && shipmentsBloc.exportShipmentDateFrom != null) {
            if (shipmentsBloc.exportShipmentDateTo!.isBefore(shipmentsBloc.exportShipmentDateFrom!)) {
              return 'shipment_filter_date_error'.tr();
            }
          } else if (shipmentsListTypes == ShipmentsListTypes.IMPORT && shipmentsBloc.importShipmentDateFrom != null) {
            if (shipmentsBloc.importShipmentDateTo!.isBefore(shipmentsBloc.importShipmentDateFrom!)) {
              return 'shipment_filter_date_error'.tr();
            }
          }
        }
        return null;
      },
      keyboardType: TextInputType.text,
    );
  }

  _getStatusTextField() {
    return FilterItemsDropDownTextField<ShipmentStatus>(
      bloc: shipmentsBloc,
      shipmentsListTypes: shipmentsListTypes,
      hasLabel: false,
      withValidator: false,
      hasMargin: false,
      onSelected: (val) {
        shipmentsBloc.add(OnItemSelectedFromDropDown<ShipmentStatus>(
          shipmentsFilterTypes: ShipmentsFilterTypes.STATUS,
          item: val,
          shipmentsListTypes: shipmentsListTypes,
        ));
      },
      shipmentsFilterTypes: ShipmentsFilterTypes.STATUS,
      selectedItem: shipmentsListTypes == ShipmentsListTypes.EXPORT
          ? shipmentsBloc.selectedExportShipmentStatus
          : shipmentsBloc.selectedImportShipmentStatus,
    );
  }

  _getServiceProviderTextField() {
    return FilterItemsDropDownTextField<LogisticsServiceBase>(
      bloc: shipmentsBloc,
      shipmentsListTypes: shipmentsListTypes,
      hasLabel: false,
      withValidator: false,
      hasMargin: false,
      onSelected: (val) {
        shipmentsBloc.add(OnItemSelectedFromDropDown<LogisticsServiceBase>(
          shipmentsFilterTypes: ShipmentsFilterTypes.SERVICE_PROVIDER,
          item: val,
          shipmentsListTypes: shipmentsListTypes,
        ));
      },
      shipmentsFilterTypes: ShipmentsFilterTypes.SERVICE_PROVIDER,
      selectedItem: shipmentsListTypes == ShipmentsListTypes.EXPORT
          ? shipmentsBloc.selectedExportServiceProvider
          : shipmentsBloc.selectedImportServiceProvider,
    );
  }

  Future<DateTime?> showDate(BuildContext context) async {
    DateTime now = DateTime.now();
    return await showDatePicker(context: context, firstDate: DateTime(2023), lastDate: now);
  }
}
