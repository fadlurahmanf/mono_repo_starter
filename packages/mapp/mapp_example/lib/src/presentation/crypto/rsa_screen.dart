import 'dart:convert';

import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:core_encrypt/encrypt.dart';

class RsaScreen extends StatefulWidget with WrapperState {
  const RsaScreen({super.key});

  @override
  State<RsaScreen> createState() => _RsaScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _RsaScreenState extends State<RsaScreen> {
  String encrypted = '';
  String decrypted = '';
  String signature = '';
  bool? isVerify;

  String privateKey = '';
  String publicKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Crypto RSA'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PRIVATE KEY: $privateKey \nPUBLIC KEY: $publicKey'),
              ElevatedButton(
                onPressed: () {
                  final key = context.get<ICryptoRSARepository>().generateKey();
                  setState(() {
                    privateKey = context.get<ICryptoRSARepository>().getEncodedPrivateKey(key.privateKey);
                    publicKey = context.get<ICryptoRSARepository>().getEncodedPublicKey(key.publicKey);
                  });
                },
                child: const Text('GENERATE RSA KEY'),
              ),
              Text('ENCRYPTED: $encrypted'),
              ElevatedButton(
                onPressed: () {
                  final res = context.get<ICryptoRSARepository>().encrypt(
                        publicKey: context.get<ICryptoRSARepository>().getPublicKey(publicKey),
                        plainText: 'PLAIN_TEXT',
                      );
                  setState(() {
                    encrypted = res;
                  });
                },
                child: const Text('ENCRYPT'),
              ),
              Text('DECRYPTED: $decrypted'),
              ElevatedButton(
                onPressed: () {
                  final res = context.get<ICryptoRSARepository>().decrypt(
                        privateKey: context.get<ICryptoRSARepository>().getPrivateKey(privateKey),
                        encryptedText: encrypted,
                      );
                  setState(() {
                    decrypted = res;
                  });
                },
                child: const Text('DECRYPT'),
              ),
              Text('SIGNATURE: $signature'),
              ElevatedButton(
                onPressed: () {
                  final res = context.get<ICryptoRSARepository>().generateSignature(
                    privateKey: context.get<ICryptoRSARepository>().getPrivateKey(privateKey),
                    plainText: 'PLAIN_TEXT',
                  );
                  setState(() {
                    signature = res;
                  });
                },
                child: const Text('GENERATE SIGNATURE'),
              ),
              Text('IS VERIFY: $isVerify'),
              ElevatedButton(
                onPressed: () {
                  final res = context.get<ICryptoRSARepository>().verifySignature(
                    publicKey: context.get<ICryptoRSARepository>().getPublicKey(publicKey),
                    plainText: 'PLAIN_TEXT',
                    base64Signature: signature,
                  );
                  setState(() {
                    isVerify = res;
                  });
                },
                child: const Text('VERIFY SIGNATURE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
