//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_settings.g.dart';

/// AppSettings
///
/// Properties:
/// * [androidVersion] 
/// * [iosVersion] 
@BuiltValue()
abstract class AppSettings implements Built<AppSettings, AppSettingsBuilder> {
  @BuiltValueField(wireName: r'AndroidVersion')
  String? get androidVersion;

  @BuiltValueField(wireName: r'IosVersion')
  String? get iosVersion;

  AppSettings._();

  factory AppSettings([void updates(AppSettingsBuilder b)]) = _$AppSettings;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppSettingsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppSettings> get serializer => _$AppSettingsSerializer();
}

class _$AppSettingsSerializer implements PrimitiveSerializer<AppSettings> {
  @override
  final Iterable<Type> types = const [AppSettings, _$AppSettings];

  @override
  final String wireName = r'AppSettings';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppSettings object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.androidVersion != null) {
      yield r'AndroidVersion';
      yield serializers.serialize(
        object.androidVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.iosVersion != null) {
      yield r'IosVersion';
      yield serializers.serialize(
        object.iosVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AppSettings object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppSettingsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'AndroidVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.androidVersion = valueDes;
          break;
        case r'IosVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.iosVersion = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AppSettings deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppSettingsBuilder();
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

