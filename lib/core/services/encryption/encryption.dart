import 'dart:developer';
import 'package:encrypt/encrypt.dart';
import 'package:injectable/injectable.dart';


@Singleton()
class Encryption {
  final key = Key.fromUtf8('wannareachappdonebyshimagreatdev');
  final iv = IV.fromLength(16);

  late final Encrypter encrypter;

  void init() {
    encrypter = Encrypter(AES(key));
  }

  String encrypt(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    //log("${encrypted.base64}", name: "encrypt");
    return encrypted.base64;
  }

  Encrypted toEncrypted(String encoded) {
    return Encrypted.fromBase64(encoded);
  }

  String decrypt(String encryptedText) {
    Encrypted encrypted = toEncrypted(encryptedText);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
