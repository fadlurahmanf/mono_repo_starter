import 'package:core_config/config.dart';
import 'package:core_encrypt/src/domain/crypto_aes_repository.dart';
import 'package:core_encrypt/src/domain/crypto_ed25519_repository.dart';
import 'package:core_encrypt/src/domain/crypto_rsa_repository.dart';
import 'package:core_encrypt/src/domain/crypto_salsa_repository.dart';
import 'package:core_encrypt/src/domain/i_crypto_aes_repository.dart';
import 'package:core_encrypt/src/domain/i_crypto_ed25519_repository.dart';
import 'package:core_encrypt/src/domain/i_crypto_rsa_repository.dart';
import 'package:core_encrypt/src/domain/i_crypto_salsa_repository.dart';
import 'package:get_it/get_it.dart';

class EncryptModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<ICryptoAESRepository>(() => CryptoAESRepository())
      ..registerLazySingleton<ICryptoEd25519Repository>(() => CryptoEd25519Repository())
      ..registerLazySingleton<ICryptoRSARepository>(() => CryptoRSARepository())
      ..registerLazySingleton<ICryptoSalsaRepository>(() => CryptoSalsaRepository());
    await registerAnotherDependency(c);
  }

  Future<void> registerAnotherDependency(GetIt c) async {}
}
