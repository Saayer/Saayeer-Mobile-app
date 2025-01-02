//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/logistic_service_get_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logistic_cost_dto.g.dart';

/// LogisticCostDto
///
/// Properties:
/// * [logisticService] 
/// * [price] 
/// * [logisticCost] 
/// * [hasError] 
/// * [errorMessage] 
@BuiltValue()
abstract class LogisticCostDto implements Built<LogisticCostDto, LogisticCostDtoBuilder> {
  @BuiltValueField(wireName: r'logisticService')
  LogisticServiceGetDto? get logisticService;

  @BuiltValueField(wireName: r'price')
  double? get price;

  @BuiltValueField(wireName: r'logisticCost')
  double? get logisticCost;

  @BuiltValueField(wireName: r'hasError')
  bool? get hasError;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  LogisticCostDto._();

  factory LogisticCostDto([void updates(LogisticCostDtoBuilder b)]) = _$LogisticCostDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogisticCostDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogisticCostDto> get serializer => _$LogisticCostDtoSerializer();
}

class _$LogisticCostDtoSerializer implements PrimitiveSerializer<LogisticCostDto> {
  @override
  final Iterable<Type> types = const [LogisticCostDto, _$LogisticCostDto];

  @override
  final String wireName = r'LogisticCostDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogisticCostDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.logisticService != null) {
      yield r'logisticService';
      yield serializers.serialize(
        object.logisticService,
        specifiedType: const FullType.nullable(LogisticServiceGetDto),
      );
    }
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType(double),
      );
    }
    if (object.logisticCost != null) {
      yield r'logisticCost';
      yield serializers.serialize(
        object.logisticCost,
        specifiedType: const FullType(double),
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
    LogisticCostDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogisticCostDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'logisticService':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(LogisticServiceGetDto),
          ) as LogisticServiceGetDto?;
          if (valueDes == null) continue;
          result.logisticService.replace(valueDes);
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.price = valueDes;
          break;
        case r'logisticCost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.logisticCost = valueDes;
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
  LogisticCostDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogisticCostDtoBuilder();
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

