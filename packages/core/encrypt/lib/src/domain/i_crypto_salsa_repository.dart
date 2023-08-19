import 'package:encrypt/encrypt.dart';

abstract class ICryptoSalsaRepository {
  String generateRandomKey();
  Key getKey(String salsaKey);
  String encrypt({required String salsaKey, required String plainText});
  String decrypt({required String salsaKey, required String encryptedText});
}