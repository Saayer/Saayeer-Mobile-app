//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_status_enum.g.dart';

class ShipmentStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Pending')
  static const ShipmentStatusEnum pending = _$pending;
  @BuiltValueEnumConst(wireName: r'Paid')
  static const ShipmentStatusEnum paid = _$paid;
  @BuiltValueEnumConst(wireName: r'Requested')
  static const ShipmentStatusEnum requested = _$requested;
  @BuiltValueEnumConst(wireName: r'Picked')
  static const ShipmentStatusEnum picked = _$picked;
  @BuiltValueEnumConst(wireName: r'OnTheWay')
  static const ShipmentStatusEnum onTheWay = _$onTheWay;
  @BuiltValueEnumConst(wireName: r'Delivered')
  static const ShipmentStatusEnum delivered = _$delivered;
  @BuiltValueEnumConst(wireName: r'NeedAction')
  static const ShipmentStatusEnum needAction = _$needAction;
  @BuiltValueEnumConst(wireName: r'UnKnown')
  static const ShipmentStatusEnum unKnown = _$unKnown;
  @BuiltValueEnumConst(wireName: r'Canceled')
  static const ShipmentStatusEnum canceled = _$canceled;
  @BuiltValueEnumConst(wireName: r'HasError')
  static const ShipmentStatusEnum hasError = _$hasError;
  @BuiltValueEnumConst(wireName: r'Ignored')
  static const ShipmentStatusEnum ignored = _$ignored;

  static Serializer<ShipmentStatusEnum> get serializer => _$shipmentStatusEnumSerializer;

  const ShipmentStatusEnum._(String name): super(name);

  static BuiltSet<ShipmentStatusEnum> get values => _$values;
  static ShipmentStatusEnum valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ShipmentStatusEnumMixin = Object with _$ShipmentStatusEnumMixin;

