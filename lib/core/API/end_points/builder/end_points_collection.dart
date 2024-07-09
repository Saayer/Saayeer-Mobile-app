import 'package:equatable/equatable.dart';

abstract class EndPointsBaseCollection extends Equatable {
  final String path;

  const EndPointsBaseCollection({
    required this.path,
  });

  @override
  List<Object> get props => [path];
}

class EndPointsClientCollection extends EndPointsBaseCollection {
  const EndPointsClientCollection({super.path = "Client/"});
}

class EndPointsStoreCollection extends EndPointsBaseCollection {
  const EndPointsStoreCollection({super.path = "Store/"});
}

class EndPointsProfileCollection extends EndPointsBaseCollection {
  const EndPointsProfileCollection({super.path = "Profile/"});
}

class EndPointShipmentCollection extends EndPointsBaseCollection {
  const EndPointShipmentCollection({super.path = "Shipment/"});
}
