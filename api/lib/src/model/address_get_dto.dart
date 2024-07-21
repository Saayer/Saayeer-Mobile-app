//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address_look_up_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'address_get_dto.g.dart';

/// AddressGetDto
///
/// Properties:
/// * [id] 
/// * [details] 
/// * [country] 
/// * [governorate] 
/// * [city] 
/// * [area] 
@BuiltValue()
abstract class AddressGetDto implements Built<AddressGetDto, AddressGetDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'details')
  String? get details;

  @BuiltValueField(wireName: r'country')
  AddressLookUpDto? get country;

  @BuiltValueField(wireName: r'governorate')
  AddressLookUpDto? get governorate;

  @BuiltValueField(wireName: r'city')
  AddressLookUpDto? get city;

  @BuiltValueField(wireName: r'area')
  AddressLookUpDto? get area;

  AddressGetDto._();

  factory AddressGetDto([void updates(AddressGetDtoBuilder b)]) = _$AddressGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddressGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddressGetDto> get serializer => _$AddressGetDtoSerializer();
}

class _$AddressGetDtoSerializer implements PrimitiveSerializer<AddressGetDto> {
  @override
  final Iterable<Type> types = const [AddressGetDto, _$AddressGetDto];

  @override
  final String wireName = r'AddressGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddressGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.details != null) {
      yield r'details';
      yield serializers.serialize(
        object.details,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.country != null) {
      yield r'country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType(AddressLookUpDto),
      );
    }
    if (object.governorate != null) {
      yield r'governorate';
      yield serializers.serialize(
        object.governorate,
        specifiedType: const FullType(AddressLookUpDto),
      );
    }
    if (object.city != null) {
      yield r'city';
      yield serializers.serialize(
        object.city,
        specifiedType: const FullType(AddressLookUpDto),
      );
    }
    if (object.area != null) {
      yield r'area';
      yield serializers.serialize(
        object.area,
        specifiedType: const FullType(AddressLookUpDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddressGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddressGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.details = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddressLookUpDto),
          ) as AddressLookUpDto;
          result.country.replace(valueDes);
          break;
        case r'governorate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddressLookUpDto),
          ) as AddressLookUpDto;
          result.governorate.replace(valueDes);
          break;
        case r'city':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddressLookUpDto),
          ) as AddressLookUpDto;
          result.city.replace(valueDes);
          break;
        case r'area':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddressLookUpDto),
          ) as AddressLookUpDto;
          result.area.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddressGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddressGetDtoBuilder();
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

