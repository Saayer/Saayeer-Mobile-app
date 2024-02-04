import 'package:equatable/equatable.dart';
import 'package:saayer/core/services/encryption/encryption.dart';
import 'package:saayer/core/services/injection/injection.dart';

class LoggedInUserEntity extends Equatable {
  String id, name, email, password, userType, gender, dateOfBirth, imageUrl;

  String get decryptPassword => getIt<Encryption>().decrypt(password);

  set encryptPassword(String value) {
    password = getIt<Encryption>().encrypt(value);
  }

  LoggedInUserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.userType,
      required this.gender,
      required this.dateOfBirth,
      required this.imageUrl});

  @override
  List<Object?> get props =>
      [id, name, email, userType, gender, dateOfBirth, imageUrl];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'userType': userType,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'imageUrl': imageUrl,
    };
  }

  factory LoggedInUserEntity.fromJson(Map<String, dynamic> map) {
    return LoggedInUserEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userType: map['userType'] as String,
      gender: map['gender'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  LoggedInUserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? userType,
    String? gender,
    String? dateOfBirth,
    String? imageUrl,
  }) {
    return LoggedInUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
