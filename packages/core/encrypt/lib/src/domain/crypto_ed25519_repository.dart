import 'dart:convert';
import 'dart:typed_data';

import 'package:core_encrypt/src/domain/i_crypto_ed25519_repository.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

class CryptoEd25519Repository implements ICryptoEd25519Repository {
  @override
  ed.KeyPair generateEd25519Key() {
    return ed.generateKey();
  }

  @override
  ed.PrivateKey getPrivateKey(String base64PrivateKey) {
    return ed.PrivateKey(base64.decode(base64PrivateKey));
  }

  @override
  ed.PublicKey getPublicKey(String base64PublicKey) {
    return ed.PublicKey(base64.decode(base64PublicKey));
  }

  @override
  ed.PublicKey getPublicKeyFromPrivateKey(String base64PrivateKey) {
    return ed.public(getPrivateKey(base64PrivateKey));
  }

  @override
  String createSignature({required ed.PrivateKey privateKey, required String plainText}) {
    final message = utf8.encode(plainText) as Uint8List;
    return base64.encode(ed.sign(privateKey, message));
  }

  @override
  bool verifySignature({
    required ed.PublicKey publicKey,
    required ed.PrivateKey privateKey,
    required String plainText,
  }) {
    final message = utf8.encode(plainText) as Uint8List;
    final sign = ed.sign(privateKey, message);
    return ed.verify(publicKey, message, sign);
  }
}
