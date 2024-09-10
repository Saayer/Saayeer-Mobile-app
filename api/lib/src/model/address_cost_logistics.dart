//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'address_cost_logistics.g.dart';

/// AddressCostLogistics
///
/// Properties:
/// * [addressDetails] 
/// * [countryCode] 
/// * [stateCode] 
/// * [countryNameEn] 
/// * [governorateNameEn] 
/// * [cityNameEn] 
/// * [areaNameEn] 
@BuiltValue()
abstract class AddressCostLogistics implements Built<AddressCostLogistics, AddressCostLogisticsBuilder> {
  @BuiltValueField(wireName: r'addressDetails')
  String? get addressDetails;

  @BuiltValueField(wireName: r'countryCode')
  String? get countryCode;

  @BuiltValueField(wireName: r'stateCode')
  String? get stateCode;

  @BuiltValueField(wireName: r'countryName_en')
  String? get countryNameEn;

  @BuiltValueField(wireName: r'governorateName_en')
  String? get governorateNameEn;

  @BuiltValueField(wireName: r'cityName_en')
  String? get cityNameEn;

  @BuiltValueField(wireName: r'areaName_en')
  String? get areaNameEn;

  AddressCostLogistics._();

  factory AddressCostLogistics([void updates(AddressCostLogisticsBuilder b)]) = _$AddressCostLogistics;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddressCostLogisticsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddressCostLogistics> get serializer => _$AddressCostLogisticsSerializer();
}

class _$AddressCostLogisticsSerializer implements PrimitiveSerializer<AddressCostLogistics> {
  @override
  final Iterable<Type> types = const [AddressCostLogistics, _$AddressCostLogistics];

  @override
  final String wireName = r'AddressCostLogistics';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddressCostLogistics object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.addressDetails != null) {
      yield r'addressDetails';
      yield serializers.serialize(
        object.addressDetails,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.countryCode != null) {
      yield r'countryCode';
      yield serializers.serialize(
        object.countryCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.stateCode != null) {
      yield r'stateCode';
      yield serializers.serialize(
        object.stateCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.countryNameEn != null) {
      yield r'countryName_en';
      yield serializers.serialize(
        object.countryNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.governorateNameEn != null) {
      yield r'governorateName_en';
      yield serializers.serialize(
        object.governorateNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.cityNameEn != null) {
      yield r'cityName_en';
      yield serializers.serialize(
        object.cityNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.areaNameEn != null) {
      yield r'areaName_en';
      yield serializers.serialize(
        object.areaNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddressCostLogistics object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddressCostLogisticsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'addressDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.addressDetails = valueDes;
          break;
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.countryCode = valueDes;
          break;
        case r'stateCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stateCode = valueDes;
          break;
        case r'countryName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.countryNameEn = valueDes;
          break;
        case r'governorateName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.governorateNameEn = valueDes;
          break;
        case r'cityName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cityNameEn = valueDes;
          break;
        case r'areaName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.areaNameEn = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddressCostLogistics deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddressCostLogisticsBuilder();
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

