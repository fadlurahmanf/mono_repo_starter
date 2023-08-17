import 'dart:convert';

import 'package:core_encrypt/src/domain/i_crypto_salsa_repository.dart';
import 'package:encrypt/encrypt.dart';

class CryptoSalsaRepository implements ICryptoSalsaRepository {
  @override
  Key getKey(String salsaKey) {
    return Key.fromUtf8(salsaKey);
  }

  @override
  String encrypt({required String salsaKey, required String plainText}) {
    final encrypter = Encrypter(Salsa20(getKey(salsaKey)));
    final iv = IV.fromLength(16);
    return encrypter.encrypt(plainText, iv: iv).base64;
  }

  @override
  String decrypt({required String salsaKey, required String encryptedText}) {
    final encrypter = Encrypter(Salsa20(getKey(salsaKey)));
    final iv = IV.fromLength(16);
    return encrypter.decrypt64(encryptedText, iv: iv);
  }
}
