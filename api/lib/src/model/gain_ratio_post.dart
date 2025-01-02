//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'gain_ratio_post.g.dart';

/// GainRatioPost
///
/// Properties:
/// * [newGainRatio] 
@BuiltValue()
abstract class GainRatioPost implements Built<GainRatioPost, GainRatioPostBuilder> {
  @BuiltValueField(wireName: r'newGainRatio')
  double? get newGainRatio;

  GainRatioPost._();

  factory GainRatioPost([void updates(GainRatioPostBuilder b)]) = _$GainRatioPost;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GainRatioPostBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GainRatioPost> get serializer => _$GainRatioPostSerializer();
}

class _$GainRatioPostSerializer implements PrimitiveSerializer<GainRatioPost> {
  @override
  final Iterable<Type> types = const [GainRatioPost, _$GainRatioPost];

  @override
  final String wireName = r'GainRatioPost';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GainRatioPost object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.newGainRatio != null) {
      yield r'newGainRatio';
      yield serializers.serialize(
        object.newGainRatio,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GainRatioPost object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GainRatioPostBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newGainRatio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.newGainRatio = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GainRatioPost deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GainRatioPostBuilder();
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

