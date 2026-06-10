//import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;

abstract class AppFailure {
  final String messages;
  AppFailure(this.messages);
}

//no internet
// timeout

class NetworkFailure extends AppFailure {
  NetworkFailure([String messages = "Network Failure"]) : super(messages);
}

// no auth
class NoAuthFailure extends AppFailure {
  NoAuthFailure([String messages = "No Auth Failure"]) : super(messages);
}

//server error

class ServerFailure extends AppFailure {
  ServerFailure([String messages = "Server Failure"]) : super(messages);
}

//type error

class TypeErrorFailure extends AppFailure {
  TypeErrorFailure([String messages = "Type Error"]) : super(messages);
}

class ErrorMaper {
  static AppFailure mapErrorFromDio(dio.DioException ex) {
    switch (ex.type) {
      case dio.DioException.connectionTimeout:
      case dio.DioException.sendTimeout:
      case dio.DioException.receiveTimeout:
        return NetworkFailure();
      case dio.DioException.connectionError:
        return NetworkFailure();
      case dio.DioException.badResponse:
        if (ex.response?.statusCode == 401) {
          return NoAuthFailure();
        } else {
          return ServerFailure();
        }
      default:
        return TypeErrorFailure("Unexpected Error: ${ex.message}");
    }
  }
}
