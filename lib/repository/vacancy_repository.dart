import 'package:dio/dio.dart';
import 'dioConfiguration.dart';
import 'api_constants.dart';

class VacancyRepository{
  final Dio _dio = Dio(dioConfiguration.conf);
  var url = "${ApiConstants.mainUrl}Vacancies/";
}