import 'package:get/get.dart';

class CoreAppSettings {
  Map<String, Map<String, String>> translationKeys;
  final List<GetPage<dynamic>> pages;
  final GetPage<dynamic> unknownRoute;

  CoreAppSettings({required this.pages, required this.unknownRoute, required this.translationKeys});

  copyWith({
    List<GetPage<dynamic>>? pages,
  }) {
    return CoreAppSettings(pages: pages ?? this.pages, unknownRoute: unknownRoute, translationKeys: translationKeys);
  }
}
