import 'package:get/get.dart';

class CoreAppSettings {
  final List<GetPage<dynamic>> pages;
  final GetPage<dynamic> unknownRoute;

  CoreAppSettings({required this.pages, required this.unknownRoute});

  copyWith({
    List<GetPage<dynamic>>? pages,
  }) {
    return CoreAppSettings(pages: pages ?? this.pages, unknownRoute: unknownRoute);
  }
}
