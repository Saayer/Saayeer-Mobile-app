//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_get_dto.g.dart';

/// ClientGetDto
///
/// Properties:
/// * [clientId] 
/// * [fullName] 
/// * [phoneNo] 
/// * [email] 
/// * [businessName] 
/// * [address] 
/// * [totalShipments] 
/// * [totalPaid] 
/// * [numberOfStores] 
@BuiltValue()
abstract class ClientGetDto implements Built<ClientGetDto, ClientGetDtoBuilder> {
  @BuiltValueField(wireName: r'clientId')
  int? get clientId;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  @BuiltValueField(wireName: r'phoneNo')
  String? get phoneNo;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'businessName')
  String? get businessName;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'totalShipments')
  int? get totalShipments;

  @BuiltValueField(wireName: r'totalPaid')
  double? get totalPaid;

  @BuiltValueField(wireName: r'numberOfStores')
  int? get numberOfStores;

  ClientGetDto._();

  factory ClientGetDto([void updates(ClientGetDtoBuilder b)]) = _$ClientGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientGetDto> get serializer => _$ClientGetDtoSerializer();
}

class _$ClientGetDtoSerializer implements PrimitiveSerializer<ClientGetDto> {
  @override
  final Iterable<Type> types = const [ClientGetDto, _$ClientGetDto];

  @override
  final String wireName = r'ClientGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.clientId != null) {
      yield r'clientId';
      yield serializers.serialize(
        object.clientId,
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
    if (object.phoneNo != null) {
      yield r'phoneNo';
      yield serializers.serialize(
        object.phoneNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.businessName != null) {
      yield r'businessName';
      yield serializers.serialize(
        object.businessName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalShipments != null) {
      yield r'totalShipments';
      yield serializers.serialize(
        object.totalShipments,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.totalPaid != null) {
      yield r'totalPaid';
      yield serializers.serialize(
        object.totalPaid,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.numberOfStores != null) {
      yield r'numberOfStores';
      yield serializers.serialize(
        object.numberOfStores,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClientGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clientId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.clientId = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        case r'phoneNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNo = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'businessName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.businessName = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'totalShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalShipments = valueDes;
          break;
        case r'totalPaid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.totalPaid = valueDes;
          break;
        case r'numberOfStores':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.numberOfStores = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientGetDtoBuilder();
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

