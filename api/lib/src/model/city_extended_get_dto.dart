//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address_look_up_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'city_extended_get_dto.g.dart';

/// CityExtendedGetDto
///
/// Properties:
/// * [id] 
/// * [nameEn] 
/// * [nameAr] 
/// * [aramexPickupAvailable] 
/// * [aramexDeliveryAvailable] 
/// * [governorate] 
@BuiltValue()
abstract class CityExtendedGetDto implements Built<CityExtendedGetDto, CityExtendedGetDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name_en')
  String? get nameEn;

  @BuiltValueField(wireName: r'name_ar')
  String? get nameAr;

  @BuiltValueField(wireName: r'aramexPickupAvailable')
  bool? get aramexPickupAvailable;

  @BuiltValueField(wireName: r'aramexDeliveryAvailable')
  bool? get aramexDeliveryAvailable;

  @BuiltValueField(wireName: r'governorate')
  AddressLookUpDto? get governorate;

  CityExtendedGetDto._();

  factory CityExtendedGetDto([void updates(CityExtendedGetDtoBuilder b)]) = _$CityExtendedGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CityExtendedGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CityExtendedGetDto> get serializer => _$CityExtendedGetDtoSerializer();
}

class _$CityExtendedGetDtoSerializer implements PrimitiveSerializer<CityExtendedGetDto> {
  @override
  final Iterable<Type> types = const [CityExtendedGetDto, _$CityExtendedGetDto];

  @override
  final String wireName = r'CityExtendedGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CityExtendedGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.nameEn != null) {
      yield r'name_en';
      yield serializers.serialize(
        object.nameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nameAr != null) {
      yield r'name_ar';
      yield serializers.serialize(
        object.nameAr,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.aramexPickupAvailable != null) {
      yield r'aramexPickupAvailable';
      yield serializers.serialize(
        object.aramexPickupAvailable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.aramexDeliveryAvailable != null) {
      yield r'aramexDeliveryAvailable';
      yield serializers.serialize(
        object.aramexDeliveryAvailable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.governorate != null) {
      yield r'governorate';
      yield serializers.serialize(
        object.governorate,
        specifiedType: const FullType.nullable(AddressLookUpDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CityExtendedGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CityExtendedGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameEn = valueDes;
          break;
        case r'name_ar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameAr = valueDes;
          break;
        case r'aramexPickupAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.aramexPickupAvailable = valueDes;
          break;
        case r'aramexDeliveryAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.aramexDeliveryAvailable = valueDes;
          break;
        case r'governorate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AddressLookUpDto),
          ) as AddressLookUpDto?;
          if (valueDes == null) continue;
          result.governorate.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CityExtendedGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CityExtendedGetDtoBuilder();
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

