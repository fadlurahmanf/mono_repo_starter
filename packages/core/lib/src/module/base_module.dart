import 'package:get_it/get_it.dart';

abstract class BaseModule {
  Future<void> registerDependency(GetIt c);
}