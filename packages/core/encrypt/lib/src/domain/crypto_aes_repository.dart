import 'package:core_encrypt/src/domain/i_crypto_aes_repository.dart';
import 'package:encrypt/encrypt.dart';

class CryptoAESRepository implements ICryptoAESRepository {
  @override
  Key getKey(String key) {
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
