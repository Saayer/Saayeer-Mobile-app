//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'service_cost.g.dart';

/// ServiceCost
///
/// Properties:
/// * [name] 
/// * [company] 
/// * [cost] 
/// * [workDaysMaximum] 
/// * [workDaysMinimum] 
/// * [estimatedShipmentDays] 
/// * [hasError] 
/// * [errorMessage] 
@BuiltValue()
abstract class ServiceCost implements Built<ServiceCost, ServiceCostBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'company')
  String? get company;

  @BuiltValueField(wireName: r'cost')
  double? get cost;

  @BuiltValueField(wireName: r'workDaysMaximum')
  int? get workDaysMaximum;

  @BuiltValueField(wireName: r'workDaysMinimum')
  int? get workDaysMinimum;

  @BuiltValueField(wireName: r'estimatedShipmentDays')
  String? get estimatedShipmentDays;

  @BuiltValueField(wireName: r'hasError')
  bool? get hasError;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  ServiceCost._();

  factory ServiceCost([void updates(ServiceCostBuilder b)]) = _$ServiceCost;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ServiceCostBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ServiceCost> get serializer => _$ServiceCostSerializer();
}

class _$ServiceCostSerializer implements PrimitiveSerializer<ServiceCost> {
  @override
  final Iterable<Type> types = const [ServiceCost, _$ServiceCost];

  @override
  final String wireName = r'ServiceCost';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ServiceCost object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.company != null) {
      yield r'company';
      yield serializers.serialize(
        object.company,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.cost != null) {
      yield r'cost';
      yield serializers.serialize(
        object.cost,
        specifiedType: const FullType(double),
      );
    }
    if (object.workDaysMaximum != null) {
      yield r'workDaysMaximum';
      yield serializers.serialize(
        object.workDaysMaximum,
        specifiedType: const FullType(int),
      );
    }
    if (object.workDaysMinimum != null) {
      yield r'workDaysMinimum';
      yield serializers.serialize(
        object.workDaysMinimum,
        specifiedType: const FullType(int),
      );
    }
    if (object.estimatedShipmentDays != null) {
      yield r'estimatedShipmentDays';
      yield serializers.serialize(
        object.estimatedShipmentDays,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.hasError != null) {
      yield r'hasError';
      yield serializers.serialize(
        object.hasError,
        specifiedType: const FullType(bool),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ServiceCost object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ServiceCostBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'company':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.company = valueDes;
          break;
        case r'cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.cost = valueDes;
          break;
        case r'workDaysMaximum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.workDaysMaximum = valueDes;
          break;
        case r'workDaysMinimum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.workDaysMinimum = valueDes;
          break;
        case r'estimatedShipmentDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.estimatedShipmentDays = valueDes;
          break;
        case r'hasError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasError = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ServiceCost deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServiceCostBuilder();
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

