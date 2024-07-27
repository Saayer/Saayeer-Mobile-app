//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_vm.g.dart';

/// ShipmentVM
///
/// Properties:
/// * [number] 
/// * [reciver] 
/// * [size] 
/// * [cost] 
/// * [billStatus] 
@BuiltValue()
abstract class ShipmentVM implements Built<ShipmentVM, ShipmentVMBuilder> {
  @BuiltValueField(wireName: r'Number')
  String? get number;

  @BuiltValueField(wireName: r'Reciver')
  String? get reciver;

  @BuiltValueField(wireName: r'Size')
  String? get size;

  @BuiltValueField(wireName: r'Cost')
  double? get cost;

  @BuiltValueField(wireName: r'BillStatus')
  String? get billStatus;

  ShipmentVM._();

  factory ShipmentVM([void updates(ShipmentVMBuilder b)]) = _$ShipmentVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentVM> get serializer => _$ShipmentVMSerializer();
}

class _$ShipmentVMSerializer implements PrimitiveSerializer<ShipmentVM> {
  @override
  final Iterable<Type> types = const [ShipmentVM, _$ShipmentVM];

  @override
  final String wireName = r'ShipmentVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentVM object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.number != null) {
      yield r'Number';
      yield serializers.serialize(
        object.number,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reciver != null) {
      yield r'Reciver';
      yield serializers.serialize(
        object.reciver,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.size != null) {
      yield r'Size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.cost != null) {
      yield r'Cost';
      yield serializers.serialize(
        object.cost,
        specifiedType: const FullType(double),
      );
    }
    if (object.billStatus != null) {
      yield r'BillStatus';
      yield serializers.serialize(
        object.billStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentVMBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.number = valueDes;
          break;
        case r'Reciver':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reciver = valueDes;
          break;
        case r'Size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.size = valueDes;
          break;
        case r'Cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.cost = valueDes;
          break;
        case r'BillStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.billStatus = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentVMBuilder();
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

