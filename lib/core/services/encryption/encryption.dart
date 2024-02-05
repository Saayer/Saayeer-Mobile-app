import 'dart:developer';
import 'package:encrypt/encrypt.dart';
import 'package:injectable/injectable.dart';

class Encryption {
  static final key = Key.fromUtf8('saayerappdonebyberrawyandshaimaa');
  final iv = IV.fromLength(16);

  late final Encrypter encrypter;

  String encrypt(String plainText) {
    encrypter = Encrypter(AES(key));
    final Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);
    log(encrypted.base64.toString(), name: "encrypted");
    return encrypted.base64;
  }

  Encrypted toEncrypted(String encoded) {
    return Encrypted.fromBase64(encoded);
  }

  String decrypt(String encryptedText) {
    encrypter = Encrypter(AES(key));
    try {
      final Encrypted encrypted = encrypter.encrypt(encryptedText, iv: iv);
      final String decrypted = encrypter.decrypt(encrypted, iv: iv);
      log(decrypted.toString(), name: "decrypted");
      return decrypted;
    } catch (e) {
      log(e.toString(), name: "decrypted error");
      return "";
    }
  }
}
