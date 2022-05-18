import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:find_master/extensions/BoolParsing.dart';
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/foundation.dart';
import 'dioConfiguration.dart';
import 'api_constants.dart';


class VacancyRepository{
  final Dio _dio = Dio(dioConfiguration.conf);
  var url = "${ApiConstants.mainUrl}Vacancies/";
  
  Future<List<Vacancy>> fetchVacancies() async {
    print(jwtToken.getInt()!);
    print(jwtToken.getBool()!);
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
  Future<List<Vacancy>> searchVacancies(String keyWord) async {
    Response response = await _dio.get(url + 'Search?name=$keyWord');
    return parseVacancies(response);
  }
  Future<bool> isFavorite(int userId, int vacancyId) async{
    Response res =  await _dio.get(url + 'Is_Favourite?UserId=${userId}&VacancyId=${vacancyId}');
    if(res.statusCode == 200){
      print('fist');

      return res.data.toString().ParseBool();
    }else{
      throw Exception('Wrong format');
    }
  }

  Future<bool> isApplication(int userId, int vacancyId) async{
    Response res = await _dio.get(url + 'Is_Application?UserId=${userId}&VacancyId=${vacancyId}');
    if(res.statusCode == 200){
      return res.data.toString().ParseBool();
    }else{
      throw Exception('Wrong format');
    }
  }

  Future<Response> addFavorite(int userId, int vacancyId) async {
    Response res = await _dio.post(url + 'Add_Favourite?UserId=$userId&VacancyId=$vacancyId');
    return res;
  }

  Future<Response> addApplication(int userId, int vacancyId) async {
    Response res = await _dio.post(url + 'Add_Application?UserId=$userId&VacancyId=$vacancyId');
    return res;
  }

  Future<Response> AddVacancy(String name, int salary, String employerName,
      String address, String requirments, String experience, String employmentType,
        String description) async {
    Response res = await _dio.post(url + 'Add_Vacancy?VacancyName=$name&VacancySalary=$salary&VacancyEmployerName=$employerName&VacancyAddress=$address&VacancyRequirements=$requirments&VacancyExp=$experience&VacancyEmploymentType=$employmentType&VacancyDescription=$description');
    return res;
  }

  List<Vacancy> parseVacancies(Response response) {
    print(response.data.toString());


    return (response.data as List).map<Vacancy>((json) => Vacancy.fromJson(json)).toList();
  }
}