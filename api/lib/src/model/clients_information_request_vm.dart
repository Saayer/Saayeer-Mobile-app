//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clients_information_request_vm.g.dart';

/// ClientsInformationRequestVM
///
/// Properties:
/// * [fullName] 
/// * [address] 
/// * [mobile] 
/// * [email] 
/// * [districtId] 
/// * [cityId] 
/// * [countryId] 
@BuiltValue()
abstract class ClientsInformationRequestVM implements Built<ClientsInformationRequestVM, ClientsInformationRequestVMBuilder> {
  @BuiltValueField(wireName: r'FullName')
  String? get fullName;

  @BuiltValueField(wireName: r'Address')
  String? get address;

  @BuiltValueField(wireName: r'Mobile')
  String? get mobile;

  @BuiltValueField(wireName: r'Email')
  String? get email;

  @BuiltValueField(wireName: r'DistrictId')
  int? get districtId;

  @BuiltValueField(wireName: r'CityId')
  int? get cityId;

  @BuiltValueField(wireName: r'CountryId')
  int? get countryId;

  ClientsInformationRequestVM._();

  factory ClientsInformationRequestVM([void updates(ClientsInformationRequestVMBuilder b)]) = _$ClientsInformationRequestVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientsInformationRequestVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientsInformationRequestVM> get serializer => _$ClientsInformationRequestVMSerializer();
}

class _$ClientsInformationRequestVMSerializer implements PrimitiveSerializer<ClientsInformationRequestVM> {
  @override
  final Iterable<Type> types = const [ClientsInformationRequestVM, _$ClientsInformationRequestVM];

  @override
  final String wireName = r'ClientsInformationRequestVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientsInformationRequestVM object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fullName != null) {
      yield r'FullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.address != null) {
      yield r'Address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.mobile != null) {
      yield r'Mobile';
      yield serializers.serialize(
        object.mobile,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'Email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.districtId != null) {
      yield r'DistrictId';
      yield serializers.serialize(
        object.districtId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.cityId != null) {
      yield r'CityId';
      yield serializers.serialize(
        object.cityId,
        specifiedType: const FullType(int),
      );
    }
    if (object.countryId != null) {
      yield r'CountryId';
      yield serializers.serialize(
        object.countryId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientsInformationRequestVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClientsInformationRequestVMBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'FullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        case r'Address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'Mobile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mobile = valueDes;
          break;
        case r'Email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'DistrictId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.districtId = valueDes;
          break;
        case r'CityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cityId = valueDes;
          break;
        case r'CountryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.countryId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientsInformationRequestVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientsInformationRequestVMBuilder();
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

