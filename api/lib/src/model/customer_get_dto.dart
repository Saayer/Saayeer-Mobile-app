//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address_get_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_get_dto.g.dart';

/// CustomerGetDto
///
/// Properties:
/// * [id] 
/// * [fullName] 
/// * [address] 
@BuiltValue()
abstract class CustomerGetDto implements Built<CustomerGetDto, CustomerGetDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  @BuiltValueField(wireName: r'address')
  AddressGetDto? get address;

  CustomerGetDto._();

  factory CustomerGetDto([void updates(CustomerGetDtoBuilder b)]) = _$CustomerGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerGetDto> get serializer => _$CustomerGetDtoSerializer();
}

class _$CustomerGetDtoSerializer implements PrimitiveSerializer<CustomerGetDto> {
  @override
  final Iterable<Type> types = const [CustomerGetDto, _$CustomerGetDto];

  @override
  final String wireName = r'CustomerGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.fullName != null) {
      yield r'fullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(AddressGetDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerGetDtoBuilder result,
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
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddressGetDto),
          ) as AddressGetDto;
          result.address.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CustomerGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerGetDtoBuilder();
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

