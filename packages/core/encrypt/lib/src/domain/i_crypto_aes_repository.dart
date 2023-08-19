import 'package:encrypt/encrypt.dart';

abstract class ICryptoAESRepository {
  String generateRandomKey(int length); // key must be 16, 24, 32
  Key getKey(String key); // key must be 16, 24, 32
  String encrypt({required String aesKey, required String plainText});
  String decrypt({required String aesKey, required String encryptedText});
}