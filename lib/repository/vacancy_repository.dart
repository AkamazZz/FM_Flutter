import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/foundation.dart';
import 'dioConfiguration.dart';
import 'api_constants.dart';


class VacancyRepository{
  final Dio _dio = Dio(dioConfiguration.conf);
  var url = "${ApiConstants.mainUrl}Vacancies/";
  
  Future<List<Vacancy>> fetchVacancies() async {
    Response response = await _dio.get(url + 'Get_All_Vacancies');
    return parseVacancies(response);
  }
  Future<List<Vacancy>> fetchApplications() async {
    Response response = await _dio.get(url + 'Get_All_Applications?UserId=${jwtToken.getInt()!}');
    return parseVacancies(response);
  }
  Future<List<Vacancy>> fetchFavorites() async {
    Response response = await _dio.get(url + 'Get_All_Favourites?UserId=${jwtToken.getInt()!}');
    return parseVacancies(response);
  }

  List<Vacancy> parseVacancies(Response response) {
    print('im gay');


    return (response.data as List).map<Vacancy>((json) => Vacancy.fromJson(json)).toList();
  }
}