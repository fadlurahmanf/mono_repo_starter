import 'dart:convert';

import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:core_encrypt/encrypt.dart';

class Ed25519Screen extends StatefulWidget with WrapperState {
  const Ed25519Screen({super.key});

  @override
  State<Ed25519Screen> createState() => _Ed25519ScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _Ed25519ScreenState extends State<Ed25519Screen> {
  String signature = '';
  bool? isVerifySignature;

  String privateKey = '';
  String publicKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PRIVATE KEY: $privateKey \nPUBLIC KEY: $publicKey'),
              ElevatedButton(
                onPressed: () {
                  final key = context.get<ICryptoEd25519Repository>().generateEd25519Key();
                  setState(() {
                    privateKey = base64.encode(key.privateKey.bytes);
                    publicKey = base64.encode(key.publicKey.bytes);
                  });
                },
                child: const Text('GENERATE ED25519 KEY'),
              ),
              Text('SIGNATURE: $signature'),
              ElevatedButton(
                onPressed: () {
                  final key = context.get<ICryptoEd25519Repository>().createSignature(
                        privateKey: context.get<ICryptoEd25519Repository>().getPrivateKey(privateKey),
                        plainText: 'PLAIN_TEXT',
                      );
                  setState(() {
                    signature = key;
                  });
                },
                child: const Text('GENERATE SIGNATURE'),
              ),
              Text('IS VERIFY: $isVerifySignature'),
              ElevatedButton(
                onPressed: () {
                  final isVerify = context.get<ICryptoEd25519Repository>().verifySignatureType2(
                        publicKey: context.get<ICryptoEd25519Repository>().getPublicKey(publicKey),
                        plainText: 'PLAIN_TEXT',
                        base64Signature: signature,
                      );
                  setState(() {
                    isVerifySignature = isVerify;
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
