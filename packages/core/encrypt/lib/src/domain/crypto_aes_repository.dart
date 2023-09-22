import 'dart:math';

import 'package:core_encrypt/src/domain/i_crypto_aes_repository.dart';
import 'package:encrypt/encrypt.dart';

class CryptoAESRepository implements ICryptoAESRepository {
  @override
  String generateRandomKey(int length) {
    const mChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => mChars.codeUnitAt(Random.secure().nextInt(mChars.length)),
      ),
    );
  }

  @override
  Key getKey(String key) {
    // key should be 16, 24, or 32
    return Key.fromUtf8(key);
  }

  @override
  String decrypt({required String aesKey, required String encryptedText}) {
    final encrypter = Encrypter(AES(getKey(aesKey), mode: AESMode.cbc));
    final iv = IV.fromLength(16);
    return encrypter.decrypt64(encryptedText, iv: iv);
  }

  @override
  String encrypt({required String aesKey, required String plainText}) {
    final encrypter = Encrypter(AES(getKey(aesKey), mode: AESMode.cbc));
    final iv = IV.fromLength(16);
    return encrypter.encrypt(plainText, iv: iv).base64;
  }
}
