//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_shipment_status.g.dart';

class CreateShipmentStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Pickup_Not_Created')
  static const CreateShipmentStatus pickupNotCreated = _$pickupNotCreated;

  static Serializer<CreateShipmentStatus> get serializer => _$createShipmentStatusSerializer;

  const CreateShipmentStatus._(String name): super(name);

  static BuiltSet<CreateShipmentStatus> get values => _$values;
  static CreateShipmentStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CreateShipmentStatusMixin = Object with _$CreateShipmentStatusMixin;

