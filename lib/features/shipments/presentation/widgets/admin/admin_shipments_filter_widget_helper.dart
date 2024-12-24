import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text_fields/base_text_field.dart';
import 'package:saayer/core/helpers/utils_helper/date_time_utils.dart';
import 'package:saayer/features/shipments/core/utils/enums/enums.dart';
import 'package:saayer/features/shipments/presentation/bloc/shipments_bloc.dart';
import 'package:saayer/features/shipments/presentation/widgets/admin/admin_filter_item_drop_down_text_field.dart';

class AdminShipmentsFilterWidgetHelper {
  final AdminShipmentsFilterTypes adminShipmentsFilterTypes;
  final ShipmentsBloc shipmentsBloc;

  AdminShipmentsFilterWidgetHelper({
    required this.adminShipmentsFilterTypes,
    required this.shipmentsBloc,
  });

  getFilterItem(BuildContext context) {
    switch (adminShipmentsFilterTypes) {
      case AdminShipmentsFilterTypes.SEARCH:
        {
          return _getSearchTextField();
        }
      case AdminShipmentsFilterTypes.CLIENT:
        {
          return _getClientTextField();
        }
      case AdminShipmentsFilterTypes.SELECT_DATE_FROM:
        {
          return _getDateFromTextField(context);
        }
      case AdminShipmentsFilterTypes.SELECT_DATE_TO:
        {
          return _getDateToTextField(context);
        }
      case AdminShipmentsFilterTypes.STATUS:
        {
          return _getStatusTextField();
        }
      case AdminShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return _getServiceProviderTextField();
        }
    }
  }

  TextEditingController _getInputController() {
    switch (adminShipmentsFilterTypes) {
      case AdminShipmentsFilterTypes.SEARCH:
        {
          return shipmentsBloc.adminSearchController;
        }
      case AdminShipmentsFilterTypes.CLIENT:
        {
          return TextEditingController();
        }
      case AdminShipmentsFilterTypes.SELECT_DATE_FROM:
        {
          return shipmentsBloc.adminShipmentDateFromController;
        }
      case AdminShipmentsFilterTypes.SELECT_DATE_TO:
        {
          return shipmentsBloc.adminShipmentDateToController;
        }
      case AdminShipmentsFilterTypes.STATUS:
        {
          return shipmentsBloc.adminShipmentStatusController;
        }
      case AdminShipmentsFilterTypes.SERVICE_PROVIDER:
        {
          return TextEditingController();
        }
    }
  }

  _getSearchTextField() {
    return BaseTextField(
      hintText: adminShipmentsFilterTypes.name.tr(),
      controller: _getInputController(),
      onChanged: (val) {},
      validator: null,
      keyboardType: TextInputType.text,
    );
  }

  _getClientTextField() {
    return AdminFilterItemDropDownTextField<ClientNamesRespnse>(
      bloc: shipmentsBloc,
      adminShipmentsFilterTypes: adminShipmentsFilterTypes,
      hasLabel: false,
      withValidator: false,
      hasMargin: false,
      onSelected: (val) {
        shipmentsBloc.add(OnAdminItemSelectedFromDropDown<ClientNamesRespnse>(
          adminShipmentsFilterTypes: AdminShipmentsFilterTypes.CLIENT,
          item: val,
        ));
      },
      selectedItem: shipmentsBloc.selectedClientName,
    );
  }

  _getDateFromTextField(BuildContext context) {
    return BaseTextField(
      hintText: adminShipmentsFilterTypes.name.tr(),
      controller: _getInputController(),
      isReadOnly: true,
      onTap: () async {
        DateTime? res = await showDate(context);
        shipmentsBloc.adminShipmentDateFromController.text = DateTimeUtil.dMyString(res);
        shipmentsBloc.adminShipmentDateFrom = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
      },
      onChanged: (val) {},
      validator: null,
      keyboardType: TextInputType.text,
    );
  }

  _getDateToTextField(BuildContext context) {
    return BaseTextField(
      hintText: adminShipmentsFilterTypes.name.tr(),
      controller: _getInputController(),
      isReadOnly: true,
      onTap: () async {
        DateTime? res = await showDate(context);
        shipmentsBloc.adminShipmentDateToController.text = DateTimeUtil.dMyString(res);
        shipmentsBloc.adminShipmentDateTo = DateTimeUtil.toUtcDateTime(DateTimeUtil.dMyString(res));
        if (shipmentsBloc.adminShipmentDateTo != null) {
          shipmentsBloc.adminShipmentDateTo =
              shipmentsBloc.adminShipmentDateTo!.add(DateTimeUtil.twentyThreeHoursAndFiftyNineMin);
        }
      },
      onChanged: (val) {},
      validator: (value) {
        if (value?.isNotEmpty ?? true) {
          if (shipmentsBloc.adminShipmentDateTo!.isBefore(shipmentsBloc.adminShipmentDateFrom!)) {
            return 'shipment_filter_date_error'.tr();
          }
        }
        return null;
      },
      keyboardType: TextInputType.text,
    );
  }

  _getStatusTextField() {
    return AdminFilterItemDropDownTextField<ShipmentStatusEnum>(
      bloc: shipmentsBloc,
      adminShipmentsFilterTypes: adminShipmentsFilterTypes,
      hasLabel: false,
      withValidator: false,
      hasMargin: false,
      onSelected: (val) {
        shipmentsBloc.add(OnAdminItemSelectedFromDropDown<ShipmentStatusEnum>(
          adminShipmentsFilterTypes: AdminShipmentsFilterTypes.STATUS,
          item: val,
        ));
      },
      selectedItem: shipmentsBloc.selectedAdminShipmentStatus,
    );
  }

  _getServiceProviderTextField() {
    return AdminFilterItemDropDownTextField<LogisticsServiceBase>(
      bloc: shipmentsBloc,
      adminShipmentsFilterTypes: adminShipmentsFilterTypes,
      hasLabel: false,
      withValidator: false,
      hasMargin: false,
      onSelected: (val) {
        shipmentsBloc.add(OnAdminItemSelectedFromDropDown<LogisticsServiceBase>(
          adminShipmentsFilterTypes: AdminShipmentsFilterTypes.SERVICE_PROVIDER,
          item: val,
        ));
      },
      selectedItem: shipmentsBloc.selectedAdminServiceProvider,
    );
  }

  Future<DateTime?> showDate(BuildContext context) async {
    DateTime now = DateTime.now();
    return await showDatePicker(context: context, firstDate: DateTime(2023), lastDate: now);
  }
}
