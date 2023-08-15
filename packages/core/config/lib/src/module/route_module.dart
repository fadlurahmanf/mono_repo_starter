import '../external/app_factory.dart';
import '../route/app_get_page.dart';

abstract class RouteModule {
  List<AppGetPage> get pages;

  Future<void> addPages() async {
    for (var page in pages) {
      AppFactory.I.addPage(page);
    }
  }
}