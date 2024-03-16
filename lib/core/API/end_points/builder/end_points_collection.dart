import 'package:equatable/equatable.dart';

abstract class EndPointsBaseCollection extends Equatable {
  final String path;

  const EndPointsBaseCollection({
    required this.path,
  });

  @override
  List<Object> get props => [path];
}

class EndPointsAccountCollection extends EndPointsBaseCollection {
  const EndPointsAccountCollection({super.path = "account/"});
}

class EndPointShipmentCollection extends EndPointsBaseCollection {
  const EndPointShipmentCollection({super.path = "Shipment/"});
}
