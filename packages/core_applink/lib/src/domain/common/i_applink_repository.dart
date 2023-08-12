import 'package:app_links/app_links.dart';

abstract class IAppLinkRepository {
  AppLinks get appLinks;

  void uriListener(void Function(Uri) onData);
}