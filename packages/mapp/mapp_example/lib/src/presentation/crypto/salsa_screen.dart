import 'package:core_config/config.dart';
import 'package:core_encrypt/encrypt.dart';
import 'package:flutter/material.dart';

class SalsaScreen extends StatefulWidget with WrapperState {
  const SalsaScreen({super.key});

  @override
  State<SalsaScreen> createState() => _SalsaScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _SalsaScreenState extends State<SalsaScreen> {
  String encrypted = '';
  String decrypted = '';
  String generateRandomKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example RSA"),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('RANDOM KEY: $generateRandomKey'),
              ElevatedButton(
                onPressed: () {
                  final res = context.get<ICryptoSalsaRepository>().generateRandomKey();
                  setState(() {
                    generateRandomKey = res;
                  });
                },
                child: const Text('GENERATE RANDOM KEY'),
              ),
              Text('ENCRYPTED: $encrypted'),
              ElevatedButton(
                onPressed: () {
                  final res = context.get<ICryptoSalsaRepository>().encrypt(
                        salsaKey: generateRandomKey,
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
                  final res = context.get<ICryptoSalsaRepository>().decrypt(
                        salsaKey: generateRandomKey,
                        encryptedText: encrypted,
                      );
                  setState(() {
                    decrypted = res;
                  });
                },
                child: const Text('DECRYPT'),
              ),
              // Text('DECRYPTED: $decrypted'),
              // ElevatedButton(
              //   onPressed: () {
              //     final res = context.get<ICryptoRSARepository>().decrypt(
              //       privateKey: context.get<ICryptoRSARepository>().getPrivateKey(privateKey),
              //       encryptedText: encrypted,
              //     );
              //     setState(() {
              //       decrypted = res;
              //     });
              //   },
              //   child: const Text('DECRYPT'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
