//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/shipment_status_enum.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'experimental_shipment_status_add.g.dart';

/// ExperimentalShipmentStatusAdd
///
/// Properties:
/// * [shipmentId] 
/// * [status] 
/// * [description] 
/// * [createdAt] 
@BuiltValue()
abstract class ExperimentalShipmentStatusAdd implements Built<ExperimentalShipmentStatusAdd, ExperimentalShipmentStatusAddBuilder> {
  @BuiltValueField(wireName: r'shipmentId')
  int? get shipmentId;

  @BuiltValueField(wireName: r'status')
  ShipmentStatusEnum? get status;
  // enum statusEnum {  Pending,  Paid,  Requested,  Picked,  OnTheWay,  Delivered,  NeedAction,  UnKnown,  Canceled,  HasError,  Ignored,  };

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  ExperimentalShipmentStatusAdd._();

  factory ExperimentalShipmentStatusAdd([void updates(ExperimentalShipmentStatusAddBuilder b)]) = _$ExperimentalShipmentStatusAdd;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExperimentalShipmentStatusAddBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExperimentalShipmentStatusAdd> get serializer => _$ExperimentalShipmentStatusAddSerializer();
}

class _$ExperimentalShipmentStatusAddSerializer implements PrimitiveSerializer<ExperimentalShipmentStatusAdd> {
  @override
  final Iterable<Type> types = const [ExperimentalShipmentStatusAdd, _$ExperimentalShipmentStatusAdd];

  @override
  final String wireName = r'ExperimentalShipmentStatusAdd';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExperimentalShipmentStatusAdd object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.shipmentId != null) {
      yield r'shipmentId';
      yield serializers.serialize(
        object.shipmentId,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ShipmentStatusEnum),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExperimentalShipmentStatusAdd object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExperimentalShipmentStatusAddBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'shipmentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.shipmentId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ShipmentStatusEnum),
          ) as ShipmentStatusEnum;
          result.status = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExperimentalShipmentStatusAdd deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExperimentalShipmentStatusAddBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

