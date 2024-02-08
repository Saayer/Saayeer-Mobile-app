import 'dart:developer';

import 'package:encrypt_decrypt_plus/cipher/cipher.dart';

class Encryption {
  Cipher cipher = Cipher(secretKey: "Saayer_Mobile_App");

  String encrypt(String text) {
    final String encryptedTxt = cipher.xorEncode(text);
    //log(encryptedTxt, name: "encryptedTxt");
    return encryptedTxt;
  }

  String decrypt(String encryptedTxt) {
    final String decryptedTxt = cipher.xorDecode(encryptedTxt);
    //log(decryptedTxt, name: "decryptedTxt");
    return decryptedTxt;
  }
}
