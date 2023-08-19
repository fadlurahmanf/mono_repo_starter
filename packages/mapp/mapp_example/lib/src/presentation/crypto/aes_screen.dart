import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:core_encrypt/encrypt.dart';

class AesScreen extends StatefulWidget with WrapperState {
  const AesScreen({super.key});

  @override
  State<AesScreen> createState() => _AesScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _AesScreenState extends State<AesScreen> {
  String encrypted = '';
  String generatedKey = '';
  String decrypted = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('GENERATED 16 KEY: $generatedKey'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generatedKey = context.get<ICryptoAESRepository>().generateRandomKey(16);
                });
              },
              child: const Text('GENERATE 16 KEY'),
            ),
            Text('ENCRYPTED TEXT: $encrypted'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  encrypted = context.get<ICryptoAESRepository>().encrypt(
                        aesKey: generatedKey,
                        plainText: 'PLAIN_TEXT',
                      );
                });
              },
              child: const Text('ENCRYPT'),
            ),
            Text('DECRYPTED TEXT: $decrypted'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  decrypted = context.get<ICryptoAESRepository>().decrypt(
                    aesKey: generatedKey,
                    encryptedText: encrypted,
                  );
                });
              },
              child: const Text('ENCRYPT'),
            ),
          ],
        ),
      ),
    );
  }
}
