import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';

abstract class ICryptoRSARepository {
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateKey();

  String getEncodedPrivateKey(RSAPrivateKey key);

  String getEncodedPublicKey(RSAPublicKey key);

  RSAPrivateKey convertEncodedPrivateKey(String encodedPrivateKey);

  RSAPublicKey convertEncodedPublicKey(String encodedPublicKey);

  String encrypt({required RSAPublicKey publicKey, required String plainText});

  String decrypt({required RSAPrivateKey privateKey, required String encryptedText});

  String generateSignature({
    required RSAPrivateKey privateKey,
    required String plainText,
  });

  bool verifySignature({
    required RSAPublicKey publicKey,
    required String base64Signature,
    required String plainText,
  });
}