//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clients_query.g.dart';

/// ClientsQuery
///
/// Properties:
/// * [general] 
/// * [phoneNo] 
/// * [totalShipmentsMin] 
/// * [totalShipmentsMax] 
/// * [skip] 
/// * [take] 
@BuiltValue()
abstract class ClientsQuery implements Built<ClientsQuery, ClientsQueryBuilder> {
  @BuiltValueField(wireName: r'general')
  String? get general;

  @BuiltValueField(wireName: r'phoneNo')
  String? get phoneNo;

  @BuiltValueField(wireName: r'totalShipments_min')
  int? get totalShipmentsMin;

  @BuiltValueField(wireName: r'totalShipments_max')
  int? get totalShipmentsMax;

  @BuiltValueField(wireName: r'skip')
  int? get skip;

  @BuiltValueField(wireName: r'take')
  int? get take;

  ClientsQuery._();

  factory ClientsQuery([void updates(ClientsQueryBuilder b)]) = _$ClientsQuery;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientsQueryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientsQuery> get serializer => _$ClientsQuerySerializer();
}

class _$ClientsQuerySerializer implements PrimitiveSerializer<ClientsQuery> {
  @override
  final Iterable<Type> types = const [ClientsQuery, _$ClientsQuery];

  @override
  final String wireName = r'ClientsQuery';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientsQuery object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.general != null) {
      yield r'general';
      yield serializers.serialize(
        object.general,
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
    if (object.totalShipmentsMin != null) {
      yield r'totalShipments_min';
      yield serializers.serialize(
        object.totalShipmentsMin,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.totalShipmentsMax != null) {
      yield r'totalShipments_max';
      yield serializers.serialize(
        object.totalShipmentsMax,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.skip != null) {
      yield r'skip';
      yield serializers.serialize(
        object.skip,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.take != null) {
      yield r'take';
      yield serializers.serialize(
        object.take,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientsQuery object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClientsQueryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'general':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.general = valueDes;
          break;
        case r'phoneNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNo = valueDes;
          break;
        case r'totalShipments_min':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalShipmentsMin = valueDes;
          break;
        case r'totalShipments_max':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalShipmentsMax = valueDes;
          break;
        case r'skip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.skip = valueDes;
          break;
        case r'take':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.take = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientsQuery deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientsQueryBuilder();
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

