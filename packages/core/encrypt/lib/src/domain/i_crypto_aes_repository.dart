import 'package:encrypt/encrypt.dart';

abstract class ICryptoAESRepository {
  Key getKey(String key); // key must be 32
  String encrypt({required String aesKey, required String plainText});
  String decrypt({required String aesKey, required String encryptedText});
}