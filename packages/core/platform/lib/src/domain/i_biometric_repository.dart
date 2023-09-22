import 'package:local_auth/local_auth.dart';

abstract class IBiometricRepository {
  Future<bool> get isDeviceSupported;

  Future<List<BiometricType>> get availableBiometrics;

  Future<bool> authenticate({required String localizedReason});
}
