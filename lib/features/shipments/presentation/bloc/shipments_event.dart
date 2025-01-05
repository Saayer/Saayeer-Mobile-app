part of 'shipments_bloc.dart';

abstract class ShipmentsEvent extends Equatable {
  const ShipmentsEvent();
}

class InitShipments extends ShipmentsEvent {
  final bool isFromHome;
  final bool isGuest;
  final ShipmentStatusEnum? initExportShipmentStatusFilter;
  final DateTime? exportShipmentDateFrom;
  final DateTime? exportShipmentDateTo;

  const InitShipments({
    this.isFromHome = false,
    required this.isGuest,
    required this.initExportShipmentStatusFilter,
    required this.exportShipmentDateFrom,
    required this.exportShipmentDateTo,
  });

  @override
  List<Object?> get props => [
        isFromHome,
        isGuest,
        initExportShipmentStatusFilter,
        exportShipmentDateFrom,
        exportShipmentDateTo,
      ];
}

class GetExportShipments extends ShipmentsEvent {
  const GetExportShipments();

  @override
  List<Object> get props => [];
}

class GetImportShipments extends ShipmentsEvent {
  const GetImportShipments();

  @override
  List<Object> get props => [];
}

class GetStores extends ShipmentsEvent {
  const GetStores();

  @override
  List<Object> get props => [];
}

class GetServiceProviders extends ShipmentsEvent {
  const GetServiceProviders();

  @override
  List<Object> get props => [];
}

class SelectShipmentType extends ShipmentsEvent {
  final ShipmentsListTypes shipmentsType;

  const SelectShipmentType({
    required this.shipmentsType,
  });

  @override
  List<Object> get props => [shipmentsType];
}

class RefreshShipments extends ShipmentsEvent {
  @override
  List<Object> get props => [];
}

class OnItemSelectedFromDropDown<T> extends ShipmentsEvent {
  final T item;
  final ShipmentsFilterTypes shipmentsFilterTypes;
  final ShipmentsListTypes shipmentsListTypes;

  const OnItemSelectedFromDropDown({
    required this.item,
    required this.shipmentsFilterTypes,
    required this.shipmentsListTypes,
  });

  @override
  List<Object?> get props => [shipmentsFilterTypes];
}

class OnAdminItemSelectedFromDropDown<T> extends ShipmentsEvent {
  final T item;
  final AdminShipmentsFilterTypes adminShipmentsFilterTypes;

  const OnAdminItemSelectedFromDropDown({
    required this.item,
    required this.adminShipmentsFilterTypes,
  });

  @override
  List<Object?> get props => [adminShipmentsFilterTypes];
}

class OnScrollPagination extends ShipmentsEvent {
  const OnScrollPagination();

  @override
  List<Object?> get props => [];
}

class ResetExportShipmentsList extends ShipmentsEvent {
  const ResetExportShipmentsList();

  @override
  List<Object?> get props => [];
}

class ResetImportShipmentsList extends ShipmentsEvent {
  const ResetImportShipmentsList();

  @override
  List<Object?> get props => [];
}

class ResetAdminShipmentsList extends ShipmentsEvent {
  const ResetAdminShipmentsList();

  @override
  List<Object?> get props => [];
}

class GetAdminShipmentsList extends ShipmentsEvent {
  const GetAdminShipmentsList();

  @override
  List<Object?> get props => [];
}

class GetClientsList extends ShipmentsEvent {
  const GetClientsList();

  @override
  List<Object?> get props => [];
}
