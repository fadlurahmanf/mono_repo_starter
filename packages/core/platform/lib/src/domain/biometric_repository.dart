import 'package:core_platform/src/domain/i_biometric_repository.dart';
import 'package:local_auth/local_auth.dart';

class BiometricRepository implements IBiometricRepository {
  final _auth = LocalAuthentication();

  @override
  Future<bool> get isDeviceSupported => _auth.isDeviceSupported();

  @override
  Future<List<BiometricType>> get availableBiometrics => _auth.getAvailableBiometrics();

  @override
  Future<bool> authenticate({required String localizedReason}) {
    return _auth.authenticate(localizedReason: localizedReason);
  }
}
