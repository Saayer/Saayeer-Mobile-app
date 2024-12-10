//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/shipment_status_enum.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_query_l_admin.g.dart';

/// ShipmentQueryLAdmin
///
/// Properties:
/// * [general] 
/// * [shippingDateFrom] 
/// * [shippingDateTo] 
/// * [logisticServiceName] 
/// * [status] 
/// * [isReturn] 
/// * [clientId] 
/// * [skip] 
/// * [take] 
@BuiltValue()
abstract class ShipmentQueryLAdmin implements Built<ShipmentQueryLAdmin, ShipmentQueryLAdminBuilder> {
  @BuiltValueField(wireName: r'general')
  String? get general;

  @BuiltValueField(wireName: r'shippingDateFrom')
  DateTime? get shippingDateFrom;

  @BuiltValueField(wireName: r'shippingDateTo')
  DateTime? get shippingDateTo;

  @BuiltValueField(wireName: r'logisticServiceName')
  String? get logisticServiceName;

  @BuiltValueField(wireName: r'status')
  ShipmentStatusEnum? get status;
  // enum statusEnum {  Pending,  Paid,  Requested,  Picked,  OnTheWay,  Delivered,  NeedAction,  UnKnown,  Canceled,  HasError,  Ignored,  };

  @BuiltValueField(wireName: r'isReturn')
  bool? get isReturn;

  @BuiltValueField(wireName: r'clientId')
  int? get clientId;

  @BuiltValueField(wireName: r'skip')
  int? get skip;

  @BuiltValueField(wireName: r'take')
  int? get take;

  ShipmentQueryLAdmin._();

  factory ShipmentQueryLAdmin([void updates(ShipmentQueryLAdminBuilder b)]) = _$ShipmentQueryLAdmin;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentQueryLAdminBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentQueryLAdmin> get serializer => _$ShipmentQueryLAdminSerializer();
}

class _$ShipmentQueryLAdminSerializer implements PrimitiveSerializer<ShipmentQueryLAdmin> {
  @override
  final Iterable<Type> types = const [ShipmentQueryLAdmin, _$ShipmentQueryLAdmin];

  @override
  final String wireName = r'ShipmentQueryLAdmin';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentQueryLAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.general != null) {
      yield r'general';
      yield serializers.serialize(
        object.general,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.shippingDateFrom != null) {
      yield r'shippingDateFrom';
      yield serializers.serialize(
        object.shippingDateFrom,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.shippingDateTo != null) {
      yield r'shippingDateTo';
      yield serializers.serialize(
        object.shippingDateTo,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.logisticServiceName != null) {
      yield r'logisticServiceName';
      yield serializers.serialize(
        object.logisticServiceName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(ShipmentStatusEnum),
      );
    }
    if (object.isReturn != null) {
      yield r'isReturn';
      yield serializers.serialize(
        object.isReturn,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.clientId != null) {
      yield r'clientId';
      yield serializers.serialize(
        object.clientId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.skip != null) {
      yield r'skip';
      yield serializers.serialize(
        object.skip,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.take != null) {
      yield r'take';
      yield serializers.serialize(
        object.take,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentQueryLAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentQueryLAdminBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'general':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.general = valueDes;
          break;
        case r'shippingDateFrom':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.shippingDateFrom = valueDes;
          break;
        case r'shippingDateTo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.shippingDateTo = valueDes;
          break;
        case r'logisticServiceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logisticServiceName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ShipmentStatusEnum),
          ) as ShipmentStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'isReturn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isReturn = valueDes;
          break;
        case r'clientId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.clientId = valueDes;
          break;
        case r'skip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.skip = valueDes;
          break;
        case r'take':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.take = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentQueryLAdmin deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentQueryLAdminBuilder();
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

