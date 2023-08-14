import 'package:core/core.dart';

class SQLScript extends Description {
  final List<String> scripts;

  SQLScript({required this.scripts, String? figmaLink, String? description})
      : super(figmaLink: figmaLink, description: description);
}
