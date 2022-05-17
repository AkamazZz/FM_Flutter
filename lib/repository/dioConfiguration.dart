import 'package:dio/dio.dart';

class dioConfiguration{
  static BaseOptions conf =  BaseOptions(contentType: Headers.jsonContentType,
  connectTimeout: 100000,
  receiveTimeout: 100000);
}