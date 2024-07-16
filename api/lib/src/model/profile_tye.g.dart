// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_tye.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProfileTye _$all = const ProfileTye._('all');
const ProfileTye _$personal = const ProfileTye._('personal');
const ProfileTye _$bussiness = const ProfileTye._('bussiness');
const ProfileTye _$stores = const ProfileTye._('stores');

ProfileTye _$valueOf(String name) {
  switch (name) {
    case 'all':
      return _$all;
    case 'personal':
      return _$personal;
    case 'bussiness':
      return _$bussiness;
    case 'stores':
      return _$stores;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ProfileTye> _$values =
    new BuiltSet<ProfileTye>(const <ProfileTye>[
  _$all,
  _$personal,
  _$bussiness,
  _$stores,
]);

class _$ProfileTyeMeta {
  const _$ProfileTyeMeta();
  ProfileTye get all => _$all;
  ProfileTye get personal => _$personal;
  ProfileTye get bussiness => _$bussiness;
  ProfileTye get stores => _$stores;
  ProfileTye valueOf(String name) => _$valueOf(name);
  BuiltSet<ProfileTye> get values => _$values;
}

abstract class _$ProfileTyeMixin {
  // ignore: non_constant_identifier_names
  _$ProfileTyeMeta get ProfileTye => const _$ProfileTyeMeta();
}

Serializer<ProfileTye> _$profileTyeSerializer = new _$ProfileTyeSerializer();

class _$ProfileTyeSerializer implements PrimitiveSerializer<ProfileTye> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'all': 'All',
    'personal': 'Personal',
    'bussiness': 'Bussiness',
    'stores': 'Stores',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'All': 'all',
    'Personal': 'personal',
    'Bussiness': 'bussiness',
    'Stores': 'stores',
  };

  @override
  final Iterable<Type> types = const <Type>[ProfileTye];
  @override
  final String wireName = 'ProfileTye';

  @override
  Object serialize(Serializers serializers, ProfileTye object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProfileTye deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProfileTye.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
