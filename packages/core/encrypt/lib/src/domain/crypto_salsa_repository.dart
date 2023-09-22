import 'dart:convert';
import 'dart:math';

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
    final iv = IV.fromLength(8);
    return encrypter.encrypt(plainText, iv: iv).base64;
  }

  @override
  String decrypt({required String salsaKey, required String encryptedText}) {
    final encrypter = Encrypter(Salsa20(getKey(salsaKey)));
    final iv = IV.fromLength(8);
    return encrypter.decrypt64(encryptedText, iv: iv);
  }

  @override
  String generateRandomKey() {
    const mChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        32,
        (_) => mChars.codeUnitAt(Random.secure().nextInt(mChars.length)),
      ),
    );
  }
}
