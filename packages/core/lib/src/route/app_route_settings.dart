import 'package:get/get.dart';

abstract class AppRouteSettings {
  final List<GetPage<dynamic>> pages;
  final GetPage<dynamic> unknownRoute;

  AppRouteSettings({required this.pages, required this.unknownRoute});
}