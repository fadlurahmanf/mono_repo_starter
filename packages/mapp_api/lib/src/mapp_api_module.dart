import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

class MappApiModule extends ApiModule {
  @override
  Future<void> registerDependency(GetIt c) {
    // TODO: implement registerDependency
    return super.registerDependency(c);
  }


  @override
  Future<void> registerApiSetting(GetIt c) {
    // TODO: implement registerApiSetting
    throw UnimplementedError();
  }

  @override
  Future<void> registerBaseOption(GetIt c) {
    // TODO: implement registerBaseOption
    throw UnimplementedError();
  }

  @override
  Future<void> registerDio(GetIt c) {
    // TODO: implement registerDio
    throw UnimplementedError();
  }

}