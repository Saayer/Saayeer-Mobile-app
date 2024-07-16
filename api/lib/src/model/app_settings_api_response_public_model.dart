//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/app_settings.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_settings_api_response_public_model.g.dart';

/// AppSettingsApiResponsePublicModel
///
/// Properties:
/// * [success] 
/// * [data] 
/// * [errorMessage] 
@BuiltValue()
abstract class AppSettingsApiResponsePublicModel implements Built<AppSettingsApiResponsePublicModel, AppSettingsApiResponsePublicModelBuilder> {
  @BuiltValueField(wireName: r'Success')
  bool? get success;

  @BuiltValueField(wireName: r'Data')
  AppSettings? get data;

  @BuiltValueField(wireName: r'ErrorMessage')
  String? get errorMessage;

  AppSettingsApiResponsePublicModel._();

  factory AppSettingsApiResponsePublicModel([void updates(AppSettingsApiResponsePublicModelBuilder b)]) = _$AppSettingsApiResponsePublicModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppSettingsApiResponsePublicModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppSettingsApiResponsePublicModel> get serializer => _$AppSettingsApiResponsePublicModelSerializer();
}

class _$AppSettingsApiResponsePublicModelSerializer implements PrimitiveSerializer<AppSettingsApiResponsePublicModel> {
  @override
  final Iterable<Type> types = const [AppSettingsApiResponsePublicModel, _$AppSettingsApiResponsePublicModel];

  @override
  final String wireName = r'AppSettingsApiResponsePublicModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppSettingsApiResponsePublicModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'Success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.data != null) {
      yield r'Data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AppSettings),
      );
    }
    if (object.errorMessage != null) {
      yield r'ErrorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AppSettingsApiResponsePublicModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppSettingsApiResponsePublicModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'Data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppSettings),
          ) as AppSettings;
          result.data.replace(valueDes);
          break;
        case r'ErrorMessage':
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
  AppSettingsApiResponsePublicModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppSettingsApiResponsePublicModelBuilder();
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

