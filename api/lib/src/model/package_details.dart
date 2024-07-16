//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'package_details.g.dart';

/// PackageDetails
///
/// Properties:
/// * [weight] 
/// * [length] 
/// * [width] 
/// * [height] 
/// * [from] 
/// * [to] 
/// * [cost] 
@BuiltValue()
abstract class PackageDetails implements Built<PackageDetails, PackageDetailsBuilder> {
  @BuiltValueField(wireName: r'Weight')
  double? get weight;

  @BuiltValueField(wireName: r'Length')
  double? get length;

  @BuiltValueField(wireName: r'Width')
  double? get width;

  @BuiltValueField(wireName: r'Height')
  double? get height;

  @BuiltValueField(wireName: r'From')
  String? get from;

  @BuiltValueField(wireName: r'To')
  String? get to;

  @BuiltValueField(wireName: r'Cost')
  double? get cost;

  PackageDetails._();

  factory PackageDetails([void updates(PackageDetailsBuilder b)]) = _$PackageDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PackageDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PackageDetails> get serializer => _$PackageDetailsSerializer();
}

class _$PackageDetailsSerializer implements PrimitiveSerializer<PackageDetails> {
  @override
  final Iterable<Type> types = const [PackageDetails, _$PackageDetails];

  @override
  final String wireName = r'PackageDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PackageDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.weight != null) {
      yield r'Weight';
      yield serializers.serialize(
        object.weight,
        specifiedType: const FullType(double),
      );
    }
    if (object.length != null) {
      yield r'Length';
      yield serializers.serialize(
        object.length,
        specifiedType: const FullType(double),
      );
    }
    if (object.width != null) {
      yield r'Width';
      yield serializers.serialize(
        object.width,
        specifiedType: const FullType(double),
      );
    }
    if (object.height != null) {
      yield r'Height';
      yield serializers.serialize(
        object.height,
        specifiedType: const FullType(double),
      );
    }
    if (object.from != null) {
      yield r'From';
      yield serializers.serialize(
        object.from,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.to != null) {
      yield r'To';
      yield serializers.serialize(
        object.to,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    PackageDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PackageDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Weight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.weight = valueDes;
          break;
        case r'Length':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.length = valueDes;
          break;
        case r'Width':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.width = valueDes;
          break;
        case r'Height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.height = valueDes;
          break;
        case r'From':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.from = valueDes;
          break;
        case r'To':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.to = valueDes;
          break;
        case r'Cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.cost = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PackageDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PackageDetailsBuilder();
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

