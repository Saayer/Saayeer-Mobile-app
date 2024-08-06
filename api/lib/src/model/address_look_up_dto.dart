//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'address_look_up_dto.g.dart';

/// AddressLookUpDto
///
/// Properties:
/// * [id] 
/// * [nameEn] 
/// * [nameAr] 
@BuiltValue()
abstract class AddressLookUpDto implements Built<AddressLookUpDto, AddressLookUpDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name_en')
  String? get nameEn;

  @BuiltValueField(wireName: r'name_ar')
  String? get nameAr;

  AddressLookUpDto._();

  factory AddressLookUpDto([void updates(AddressLookUpDtoBuilder b)]) = _$AddressLookUpDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddressLookUpDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddressLookUpDto> get serializer => _$AddressLookUpDtoSerializer();
}

class _$AddressLookUpDtoSerializer implements PrimitiveSerializer<AddressLookUpDto> {
  @override
  final Iterable<Type> types = const [AddressLookUpDto, _$AddressLookUpDto];

  @override
  final String wireName = r'AddressLookUpDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddressLookUpDto object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AddressLookUpDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddressLookUpDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddressLookUpDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddressLookUpDtoBuilder();
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

