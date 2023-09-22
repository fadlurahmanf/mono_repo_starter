import 'package:app_links/src/app_links.dart';
import 'package:core_applink/src/domain/common/_index.dart';

class AppLinkRepository implements IAppLinkRepository {
  @override
  AppLinks get appLinks => AppLinks();

  @override
  void uriListener(void Function(Uri) onData) {
    appLinks.uriLinkStream.listen(onData);
  }
}
