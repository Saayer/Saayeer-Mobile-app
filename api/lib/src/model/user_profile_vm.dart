//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/shipment_vm.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_vm.g.dart';

/// UserProfileVM
///
/// Properties:
/// * [name] 
/// * [status] 
/// * [totalShipments] 
/// * [balance] 
/// * [totalBills] 
/// * [totalStoreRequests] 
/// * [newShipmenst] 
@BuiltValue()
abstract class UserProfileVM implements Built<UserProfileVM, UserProfileVMBuilder> {
  @BuiltValueField(wireName: r'Name')
  String? get name;

  @BuiltValueField(wireName: r'Status')
  String? get status;

  @BuiltValueField(wireName: r'TotalShipments')
  int? get totalShipments;

  @BuiltValueField(wireName: r'Balance')
  double? get balance;

  @BuiltValueField(wireName: r'TotalBills')
  int? get totalBills;

  @BuiltValueField(wireName: r'TotalStoreRequests')
  int? get totalStoreRequests;

  @BuiltValueField(wireName: r'NewShipmenst')
  BuiltList<ShipmentVM>? get newShipmenst;

  UserProfileVM._();

  factory UserProfileVM([void updates(UserProfileVMBuilder b)]) = _$UserProfileVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserProfileVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserProfileVM> get serializer => _$UserProfileVMSerializer();
}

class _$UserProfileVMSerializer implements PrimitiveSerializer<UserProfileVM> {
  @override
  final Iterable<Type> types = const [UserProfileVM, _$UserProfileVM];

  @override
  final String wireName = r'UserProfileVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserProfileVM object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'Name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'Status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalShipments != null) {
      yield r'TotalShipments';
      yield serializers.serialize(
        object.totalShipments,
        specifiedType: const FullType(int),
      );
    }
    if (object.balance != null) {
      yield r'Balance';
      yield serializers.serialize(
        object.balance,
        specifiedType: const FullType(double),
      );
    }
    if (object.totalBills != null) {
      yield r'TotalBills';
      yield serializers.serialize(
        object.totalBills,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalStoreRequests != null) {
      yield r'TotalStoreRequests';
      yield serializers.serialize(
        object.totalStoreRequests,
        specifiedType: const FullType(int),
      );
    }
    if (object.newShipmenst != null) {
      yield r'NewShipmenst';
      yield serializers.serialize(
        object.newShipmenst,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ShipmentVM)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserProfileVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserProfileVMBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'Status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'TotalShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalShipments = valueDes;
          break;
        case r'Balance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.balance = valueDes;
          break;
        case r'TotalBills':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalBills = valueDes;
          break;
        case r'TotalStoreRequests':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalStoreRequests = valueDes;
          break;
        case r'NewShipmenst':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ShipmentVM)]),
          ) as BuiltList<ShipmentVM>?;
          if (valueDes == null) continue;
          result.newShipmenst.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserProfileVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserProfileVMBuilder();
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

