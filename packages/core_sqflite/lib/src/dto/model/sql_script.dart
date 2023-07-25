import 'package:core/core.dart';

class SQLScript extends Description {
  final String script;

  SQLScript({required this.script, String? figmaLink, String? description})
      : super(figmaLink: figmaLink, description: description);
}
