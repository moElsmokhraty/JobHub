import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage: "Receive timeout in connection with server");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: "Send timeout in connection with server");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errMessage: "Bad certificate in connection with server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode,
          response: dioException.response!.data,
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "Connection error with server");
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: "No Internet Connection");
      default:
        return ServerFailure(
            errMessage:
                "Oops, Unexpected error occurred, Please try again later");
    }
  }

  factory ServerFailure.fromResponse(
      {required int? statusCode, required dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 409) {
      return ServerFailure(errMessage: response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request was not found, Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal Server Error, Please try again later');
    } else {
      return ServerFailure(
          errMessage:
              'Oops, Unexpected error occurred, Please try again later');
    }
  }
}
