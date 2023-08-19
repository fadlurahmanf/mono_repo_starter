import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

abstract class ICryptoEd25519Repository {
  ed.KeyPair generateEd25519Key();

  ed.PrivateKey getPrivateKey(String base64PrivateKey);

  ed.PublicKey getPublicKey(String base64PublicKey);

  ed.PublicKey getPublicKeyFromPrivateKey(String base64PrivateKey);

  String createSignature({required ed.PrivateKey privateKey, required String plainText});

  bool verifySignature({
    required ed.PublicKey publicKey,
    required ed.PrivateKey privateKey,
    required String plainText,
  });

  bool verifySignatureType2({
    required ed.PublicKey publicKey,
    required String base64Signature,
    required String plainText,
  });
}
