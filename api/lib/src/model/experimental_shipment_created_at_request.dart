//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'experimental_shipment_created_at_request.g.dart';

/// ExperimentalShipmentCreatedAtRequest
///
/// Properties:
/// * [createdAt] 
/// * [shipmentId] 
@BuiltValue()
abstract class ExperimentalShipmentCreatedAtRequest implements Built<ExperimentalShipmentCreatedAtRequest, ExperimentalShipmentCreatedAtRequestBuilder> {
  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'shipmentId')
  int? get shipmentId;

  ExperimentalShipmentCreatedAtRequest._();

  factory ExperimentalShipmentCreatedAtRequest([void updates(ExperimentalShipmentCreatedAtRequestBuilder b)]) = _$ExperimentalShipmentCreatedAtRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExperimentalShipmentCreatedAtRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExperimentalShipmentCreatedAtRequest> get serializer => _$ExperimentalShipmentCreatedAtRequestSerializer();
}

class _$ExperimentalShipmentCreatedAtRequestSerializer implements PrimitiveSerializer<ExperimentalShipmentCreatedAtRequest> {
  @override
  final Iterable<Type> types = const [ExperimentalShipmentCreatedAtRequest, _$ExperimentalShipmentCreatedAtRequest];

  @override
  final String wireName = r'ExperimentalShipmentCreatedAtRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExperimentalShipmentCreatedAtRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.shipmentId != null) {
      yield r'shipmentId';
      yield serializers.serialize(
        object.shipmentId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExperimentalShipmentCreatedAtRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExperimentalShipmentCreatedAtRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'shipmentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.shipmentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExperimentalShipmentCreatedAtRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExperimentalShipmentCreatedAtRequestBuilder();
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

