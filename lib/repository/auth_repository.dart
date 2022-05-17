import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_master/pages/main_page.dart';
import 'package:find_master/repository/api_constants.dart';
import 'package:find_master/repository/dioConfiguration.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthRepository{
  final Dio _dio = Dio(dioConfiguration.conf);
  var url = "${ApiConstants.mainUrl}auth/";

  Future<Response> Register(String email, String password, String name, String surname, bool isEmployer) async{

    print(url + 'register?UserEmail=${email}&UserPassword=${password}&UserName=${name}&UserSurname=${surname}&UserType=${isEmployer.toString()}');

    final res = await _dio.post(url + 'register?UserEmail=${email}&UserPassword=${password}&UserName=${name}&UserSurname=${surname}&UserType=${isEmployer.toString()}');
    if(res.statusCode == 200){
      return res;
    }else{
      throw Exception('Already exists');
    }
  }
  Future<Response> Login (String email, String password) async{

    final res = await _dio.post(url + 'Login?UserEmail=${email}&UserPassword=${password}');
    if (res.statusCode == 200){
      jwtToken.setString(res.data.toString());
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
  Future<int> GetId(String token) async{
    final res = await _dio.get(url + 'GetId?JWT=$token');
    if(res.statusCode == 200){
      return int.parse(res.data.toString());
    }else{
      throw Exception('Wrong format');
    }
  }
}