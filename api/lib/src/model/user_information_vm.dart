//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/clients_information_response_vm.dart';
import 'package:openapi/src/model/personal_information_response_vm.dart';
import 'package:openapi/src/model/business_information_response_vm.dart';
import 'package:openapi/src/model/store_information_vm.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_information_vm.g.dart';

/// UserInformationVM
///
/// Properties:
/// * [personal] 
/// * [business] 
/// * [stores] 
/// * [clients] 
/// * [score] 
/// * [scorePercentage] 
@BuiltValue()
abstract class UserInformationVM implements Built<UserInformationVM, UserInformationVMBuilder> {
  @BuiltValueField(wireName: r'Personal')
  PersonalInformationResponseVM? get personal;

  @BuiltValueField(wireName: r'Business')
  BusinessInformationResponseVM? get business;

  @BuiltValueField(wireName: r'Stores')
  BuiltList<StoreInformationVM>? get stores;

  @BuiltValueField(wireName: r'Clients')
  BuiltList<ClientsInformationResponseVM>? get clients;

  @BuiltValueField(wireName: r'Score')
  double? get score;

  @BuiltValueField(wireName: r'ScorePercentage')
  String? get scorePercentage;

  UserInformationVM._();

  factory UserInformationVM([void updates(UserInformationVMBuilder b)]) = _$UserInformationVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserInformationVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserInformationVM> get serializer => _$UserInformationVMSerializer();
}

class _$UserInformationVMSerializer implements PrimitiveSerializer<UserInformationVM> {
  @override
  final Iterable<Type> types = const [UserInformationVM, _$UserInformationVM];

  @override
  final String wireName = r'UserInformationVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserInformationVM object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.personal != null) {
      yield r'Personal';
      yield serializers.serialize(
        object.personal,
        specifiedType: const FullType(PersonalInformationResponseVM),
      );
    }
    if (object.business != null) {
      yield r'Business';
      yield serializers.serialize(
        object.business,
        specifiedType: const FullType(BusinessInformationResponseVM),
      );
    }
    if (object.stores != null) {
      yield r'Stores';
      yield serializers.serialize(
        object.stores,
        specifiedType: const FullType.nullable(BuiltList, [FullType(StoreInformationVM)]),
      );
    }
    if (object.clients != null) {
      yield r'Clients';
      yield serializers.serialize(
        object.clients,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ClientsInformationResponseVM)]),
      );
    }
    if (object.score != null) {
      yield r'Score';
      yield serializers.serialize(
        object.score,
        specifiedType: const FullType(double),
      );
    }
    if (object.scorePercentage != null) {
      yield r'ScorePercentage';
      yield serializers.serialize(
        object.scorePercentage,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserInformationVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserInformationVMBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Personal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PersonalInformationResponseVM),
          ) as PersonalInformationResponseVM;
          result.personal.replace(valueDes);
          break;
        case r'Business':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BusinessInformationResponseVM),
          ) as BusinessInformationResponseVM;
          result.business.replace(valueDes);
          break;
        case r'Stores':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(StoreInformationVM)]),
          ) as BuiltList<StoreInformationVM>?;
          if (valueDes == null) continue;
          result.stores.replace(valueDes);
          break;
        case r'Clients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ClientsInformationResponseVM)]),
          ) as BuiltList<ClientsInformationResponseVM>?;
          if (valueDes == null) continue;
          result.clients.replace(valueDes);
          break;
        case r'Score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.score = valueDes;
          break;
        case r'ScorePercentage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.scorePercentage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserInformationVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserInformationVMBuilder();
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

