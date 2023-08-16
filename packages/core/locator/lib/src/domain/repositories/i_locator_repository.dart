import 'package:geolocator/geolocator.dart';

abstract class ILocatorRepository {
  Future<LocationPermission> requestPermission();
  Future<bool> isLocationServiceEnabled();
  Future<Position> getCurrentPosition();
}