import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_shared/src/data/exception/mapp_exception.dart';

class MappResponseException extends MappException {
  final int? httpStatusCode;
  final String? statusCode;
  final String? rawTitleMessage;
  final String? titleMessage;
  final String? buttonText;
  final Map<String, dynamic>? additionalData;

  // will be forced back if close bottomsheet
  final bool? forceBack;

  // set whether the bottomsheet enable drag
  final bool? enableDrag;

  MappResponseException({
    this.httpStatusCode,
    this.statusCode,
    this.rawTitleMessage,
    this.titleMessage,
    super.rawMessage,
    super.message,
    this.buttonText,
    this.additionalData,
    this.forceBack,
    this.enableDrag,
  });

  factory MappResponseException.fromException(Exception e) {
    return MappResponseException(rawMessage: e.toString());
  }

  factory MappResponseException.fromDioException(DioException exception) {
    return MappResponseException(
        httpStatusCode: exception.response?.statusCode,
        statusCode: getStatusCode(exception),
        rawTitleMessage: getAppException(exception)?.rawTitleMessage,
        rawMessage: getAppException(exception)?.rawMessage,
        additionalData: getAdditionalData(exception));
  }

  static String? getStatusCode(DioException exception) {
    final data = exception.response?.data;
    if (data is Map<String, dynamic> && data.containsKey('code')) {
      return '${data['code']}';
    } else {
      return null;
    }
  }

  static MappResponseException? getAppException(DioException exception) {
    if (exception.response?.statusCode == HttpStatus.internalServerError) {
      return MappResponseException(rawMessage: MappConstant.EXCEPTION_GENERAL);
    } else if (exception.type == DioExceptionType.connectionTimeout) {
      return MappResponseException(rawMessage: MappConstant.CONNECT_TIMEOUT);
    } else if (exception.type == DioExceptionType.sendTimeout) {
      return MappResponseException(rawMessage: MappConstant.SEND_TIMEOUT);
    } else if (exception.type == DioExceptionType.receiveTimeout) {
      return MappResponseException(rawMessage: MappConstant.RECEIVE_TIMEOUT);
    } else if (exception.response?.statusCode == HttpStatus.notFound) {
      return MappResponseException(rawMessage: MappConstant.NETWORK_404);
    } else if (exception.type == DioExceptionType.badResponse) {
      final data = exception.response?.data;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        return MappResponseException(rawMessage: data['message']);
      } else if (exception.response?.statusCode == 500) {
        return MappResponseException(rawMessage: MappConstant.EXCEPTION_GENERAL);
      }
    } else if (exception.type == DioExceptionType.unknown) {
      if (exception.error is SocketException) {
        return MappResponseException(rawMessage: MappConstant.OFFLINE);
      }
    }
    return null;
  }

  static Map<String, dynamic>? getAdditionalData(DioException exception) {
    final dataResp = exception.response?.data;
    if (dataResp is Map<String, dynamic>) {
      final data = dataResp['data'];
      if (data != null && data is Map<String, dynamic>) {
        return dataResp['data'];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  MappResponseException copyWith({
    int? httpStatusCode,
    String? statusCode,
    String? rawTitleMessage,
    String? titleMessage,
    String? rawMessage,
    String? message,
    String? buttonText,
    Map<String, dynamic>? additionalData,
    bool? forceBack,
    bool? enableDrag,
  }) {
    return MappResponseException(
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      statusCode: statusCode ?? this.statusCode,
      rawTitleMessage: rawTitleMessage ?? this.rawTitleMessage,
      titleMessage: titleMessage ?? this.titleMessage,
      rawMessage: rawMessage ?? this.rawMessage,
      message: message ?? this.message,
      buttonText: buttonText ?? this.buttonText,
      additionalData: additionalData ?? this.additionalData,
      forceBack: forceBack ?? this.forceBack,
      enableDrag: enableDrag ?? this.enableDrag,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'httpStatusCode': httpStatusCode,
      'statusCode': statusCode,
      'rawTitleMessage': rawTitleMessage,
      'titleMessage': titleMessage,
      'rawMessage': rawMessage,
      'message': message,
      'buttonText': buttonText,
      'additionalData': additionalData,
      'forceBack': forceBack,
      'enableDrag': enableDrag,
    };
  }
}
