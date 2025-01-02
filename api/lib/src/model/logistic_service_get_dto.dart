//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logistic_service_get_dto.g.dart';

/// LogisticServiceGetDto
///
/// Properties:
/// * [logisticServiceId] 
/// * [serviceName] 
/// * [company] 
/// * [isImplemented] 
/// * [isEnabled] 
/// * [workDaysMaximum] 
/// * [workDaysMinimum] 
@BuiltValue()
abstract class LogisticServiceGetDto implements Built<LogisticServiceGetDto, LogisticServiceGetDtoBuilder> {
  @BuiltValueField(wireName: r'logisticServiceId')
  int? get logisticServiceId;

  @BuiltValueField(wireName: r'serviceName')
  String? get serviceName;

  @BuiltValueField(wireName: r'company')
  String? get company;

  @BuiltValueField(wireName: r'isImplemented')
  bool? get isImplemented;

  @BuiltValueField(wireName: r'isEnabled')
  bool? get isEnabled;

  @BuiltValueField(wireName: r'workDaysMaximum')
  int? get workDaysMaximum;

  @BuiltValueField(wireName: r'workDaysMinimum')
  int? get workDaysMinimum;

  LogisticServiceGetDto._();

  factory LogisticServiceGetDto([void updates(LogisticServiceGetDtoBuilder b)]) = _$LogisticServiceGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogisticServiceGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogisticServiceGetDto> get serializer => _$LogisticServiceGetDtoSerializer();
}

class _$LogisticServiceGetDtoSerializer implements PrimitiveSerializer<LogisticServiceGetDto> {
  @override
  final Iterable<Type> types = const [LogisticServiceGetDto, _$LogisticServiceGetDto];

  @override
  final String wireName = r'LogisticServiceGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogisticServiceGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.logisticServiceId != null) {
      yield r'logisticServiceId';
      yield serializers.serialize(
        object.logisticServiceId,
        specifiedType: const FullType(int),
      );
    }
    if (object.serviceName != null) {
      yield r'serviceName';
      yield serializers.serialize(
        object.serviceName,
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
    if (object.isImplemented != null) {
      yield r'isImplemented';
      yield serializers.serialize(
        object.isImplemented,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isEnabled != null) {
      yield r'isEnabled';
      yield serializers.serialize(
        object.isEnabled,
        specifiedType: const FullType(bool),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    LogisticServiceGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogisticServiceGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'logisticServiceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.logisticServiceId = valueDes;
          break;
        case r'serviceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.serviceName = valueDes;
          break;
        case r'company':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.company = valueDes;
          break;
        case r'isImplemented':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isImplemented = valueDes;
          break;
        case r'isEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isEnabled = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LogisticServiceGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogisticServiceGetDtoBuilder();
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

