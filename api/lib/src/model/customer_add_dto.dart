//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/address_add_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_add_dto.g.dart';

/// CustomerAddDto
///
/// Properties:
/// * [id] 
/// * [fullName] 
/// * [address] 
@BuiltValue()
abstract class CustomerAddDto implements Built<CustomerAddDto, CustomerAddDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  @BuiltValueField(wireName: r'address')
  AddressAddDto? get address;

  CustomerAddDto._();

  factory CustomerAddDto([void updates(CustomerAddDtoBuilder b)]) = _$CustomerAddDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerAddDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerAddDto> get serializer => _$CustomerAddDtoSerializer();
}

class _$CustomerAddDtoSerializer implements PrimitiveSerializer<CustomerAddDto> {
  @override
  final Iterable<Type> types = const [CustomerAddDto, _$CustomerAddDto];

  @override
  final String wireName = r'CustomerAddDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(int),
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
        specifiedType: const FullType(AddressAddDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerAddDtoBuilder result,
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
            specifiedType: const FullType(AddressAddDto),
          ) as AddressAddDto;
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
  CustomerAddDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerAddDtoBuilder();
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

