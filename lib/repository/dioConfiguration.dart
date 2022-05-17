import 'package:dio/dio.dart';

class dioConfiguration{
  static BaseOptions conf =  BaseOptions( responseType: ResponseType.plain,
  connectTimeout: 10000,
  receiveTimeout: 10000);
}