class MappException implements Exception {
  final String? rawMessage;
  final String? message;

  MappException({this.rawMessage, this.message});

  factory MappException.fromE(Exception e) {
    return MappException(rawMessage: e.toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'rawMessage': rawMessage,
      'message': message,
    };
  }
}
