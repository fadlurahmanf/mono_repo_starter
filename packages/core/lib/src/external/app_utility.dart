import 'package:get_it/get_it.dart';

late GetIt _getIt;

class AppUtility {
  AppUtility._();

  static GetIt get getIt {
    return _getIt;
  }

  static setContainer({required GetIt getIt}) {
    _getIt = getIt;
  }
}
