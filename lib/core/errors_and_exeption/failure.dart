import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timeout with ApiService",
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout with ApiService");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout with ApiService");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate error");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode ?? 500,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: "Request to ApiService was cancelled",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "Connection error with ApiService");
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: "Unexpected error, please try later",
        );
      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: "Transform timeout with ApiService");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      String message = "Unauthorized or bad request";
      if (response is Map<String, dynamic>) {
        message = response['error']?['message'] ?? message;
      }
      return ServerFailure(errorMessage: message);
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: "Your request not found, please try later",
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: "Internal server error, please try later",
      );
    } else {
      return ServerFailure(
        errorMessage: "Opps, there was an error, please try later",
      );
    }
  }
}
