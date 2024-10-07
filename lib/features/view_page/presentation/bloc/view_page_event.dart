part of 'view_page_bloc.dart';

@immutable
abstract class ViewPageEvent extends Equatable {
  const ViewPageEvent();
}

class InitViewPage extends ViewPageEvent {
  final NavBarIconTypes navBarIconType;

  const InitViewPage({required this.navBarIconType});

  @override
  List<Object?> get props => [navBarIconType];
}

class GoToPage extends ViewPageEvent {
  final NavBarIconTypes navBarIconType;

  const GoToPage({required this.navBarIconType});

  @override
  List<Object?> get props => [navBarIconType];
}

class SetShipmentsFiltersValue extends ViewPageEvent {
  final ShipmentStatusEnum? initExportShipmentStatusFilter;
  final DateTime? exportShipmentDateFrom;
  final DateTime? exportShipmentDateTo;

  const SetShipmentsFiltersValue({
    required this.initExportShipmentStatusFilter,
    required this.exportShipmentDateFrom,
    required this.exportShipmentDateTo,
  });

  @override
  List<Object?> get props => [
        initExportShipmentStatusFilter,
        exportShipmentDateFrom,
        exportShipmentDateTo,
      ];
}

class Refresh extends ViewPageEvent {
  @override
  List<Object> get props => [];
}
