import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_master/pages/main_page.dart';
import 'package:find_master/repository/api_constants.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthRepository{
  final Dio _dio = Dio(BaseOptions(

    responseType: ResponseType.plain,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  ));
  var url = "${ApiConstants.mainUrl}auth/";

  Future<http.Response> Register(String email, String password, String name, String surname, bool isEmployer) async{
    print('Im gay');
     return await http.post(Uri.parse(url + 'register?UserEmail=${email}&UserPassword=${password}&UserName=${name}&UserSurname=${surname}&UserType=${isEmployer}'));
  }
  Future<Response> Login (String email, String password) async{

    final res = await _dio.post(url + 'Login?UserEmail=${email}&UserPassword=${password}');
    if (res.statusCode == 200){
      //jwtToken.setString(jsonDecode(res.data));
      print(res.data);
      return res;
    }else{
      throw Exception('Not found');
    }
  }
  void SendVerification(String email) async{
    await http.post(Uri.parse(url + 'SendVerification?mail=${email}'));
  }
  Future<http.Response> CompareVerification(String code) async{
    return await http.post(Uri.parse(url + 'CompareVerification'));
  }
}