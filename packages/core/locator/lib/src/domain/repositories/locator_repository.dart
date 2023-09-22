import 'package:core_locator/src/domain/repositories/i_locator_repository.dart';
import 'package:geolocator/geolocator.dart';

class LocatorRepository implements ILocatorRepository {
  @override
  Future<LocationPermission> requestPermission(){
    return Geolocator.requestPermission();
  }

  @override
  Future<bool> isLocationServiceEnabled(){
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<Position> getCurrentPosition() {
    return Geolocator.getCurrentPosition();
  }
}