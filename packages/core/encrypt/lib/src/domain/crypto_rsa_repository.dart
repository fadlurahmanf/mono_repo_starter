import 'package:core_encrypt/src/domain/i_crypto_rsa_repository.dart';
import 'package:encrypt/encrypt.dart' as en;
import 'package:flutter/foundation.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart' as point;
import 'package:rsa_encrypt/rsa_encrypt.dart';

class CryptoRSARepository implements ICryptoRSARepository {
  @override
  point.AsymmetricKeyPair<point.RSAPublicKey, point.RSAPrivateKey> generateKey() {
    final rsapars = point.RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 12);
    final params = point.ParametersWithRandom(rsapars, point.SecureRandom());
    final keyGenerator = RSAKeyGenerator();
    keyGenerator.init(params);
    final keypair = keyGenerator.generateKeyPair();
    return point.AsymmetricKeyPair(keypair.publicKey as point.RSAPublicKey, keypair.privateKey as point.RSAPrivateKey);
  }

  @override
  String getEncodedPrivateKey(point.RSAPrivateKey key) {
    return RsaKeyHelper().encodePrivateKeyToPemPKCS1(key);
  }

  @override
  point.RSAPrivateKey convertEncodedPrivateKey(String encodedPrivateKey) {
    return en.RSAKeyParser().parse(encodedPrivateKey) as point.RSAPrivateKey;
  }

  @override
  point.RSAPublicKey convertEncodedPublicKey(String encodedPublicKey) {
    return en.RSAKeyParser().parse(encodedPublicKey) as point.RSAPublicKey;
  }

  @override
  String getEncodedPublicKey(point.RSAPublicKey key) {
    return RsaKeyHelper().encodePublicKeyToPemPKCS1(key);
  }

  @override
  String encrypt({required point.RSAPublicKey publicKey, required String plainText}) {
    final cipher = RSAEngine()..init(true, PublicKeyParameter<point.RSAPublicKey>(publicKey));
    final cipherText = cipher.process(Uint8List.fromList(plainText.codeUnits));
    return String.fromCharCodes(cipherText);
  }

  @override
  String decrypt({required point.RSAPrivateKey privateKey, required String encryptedText}) {
    final cipher = RSAEngine()..init(false, point.PrivateKeyParameter<point.RSAPrivateKey>(privateKey));
    final decrypted = cipher.process(Uint8List.fromList(encryptedText.codeUnits));
    return String.fromCharCodes(decrypted);
  }

  @override
  String generateSignature({
    required point.RSAPrivateKey privateKey,
    required String plainText,
  }) {
    final signer = en.Signer(en.RSASigner(en.RSASignDigest.SHA256, privateKey: privateKey));
    return signer.sign(plainText).base64;
  }

  @override
  bool verifySignature({
    required point.RSAPublicKey publicKey,
    required String base64Signature,
    required String plainText,
  }) {
    final signer = en.Signer(en.RSASigner(en.RSASignDigest.SHA256, publicKey: publicKey));
    return signer.verify64(plainText, base64Signature);
  }
}
