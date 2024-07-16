//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'profile_tye.g.dart';

class ProfileTye extends EnumClass {

  @BuiltValueEnumConst(wireName: r'All')
  static const ProfileTye all = _$all;
  @BuiltValueEnumConst(wireName: r'Personal')
  static const ProfileTye personal = _$personal;
  @BuiltValueEnumConst(wireName: r'Bussiness')
  static const ProfileTye bussiness = _$bussiness;
  @BuiltValueEnumConst(wireName: r'Stores')
  static const ProfileTye stores = _$stores;

  static Serializer<ProfileTye> get serializer => _$profileTyeSerializer;

  const ProfileTye._(String name): super(name);

  static BuiltSet<ProfileTye> get values => _$values;
  static ProfileTye valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProfileTyeMixin = Object with _$ProfileTyeMixin;

