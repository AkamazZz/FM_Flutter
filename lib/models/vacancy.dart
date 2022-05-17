import "dart:core";

import 'package:equatable/equatable.dart';
class Vacancy {
  final int Vacancy_id;
  final String vacancy_name;
  final int vacancy_salary;
  final String vacancy_employer_name;
  final String vacancy_address;
  final String vacancy_requirments;
  final String vacancy_exp;
  final String vacancy_employment_type;
  final String vacancy_description;


  const Vacancy({required this.Vacancy_id, required this.vacancy_name, required this.vacancy_employer_name,
      required this.vacancy_address, required this.vacancy_requirments, required this.vacancy_exp,
      required this.vacancy_employment_type, required this.vacancy_description, required this.vacancy_salary});

  factory Vacancy.fromJson(Map<String, dynamic> json){
    return Vacancy(Vacancy_id: json['vacancyId'] ?? 0,
    vacancy_name: json['vacancyName'] ?? 'not found',
    vacancy_salary: json['vacancySalary'] ?? 'Not specified',
    vacancy_employer_name: json['vacancyEmployerName'] ?? 'Not found',
    vacancy_address: json['vacancyAddress'] ?? 'Not found',
    vacancy_requirments:  json['vacancyRequirements'] ?? 'Not specified',
    vacancy_exp: json['vacancyExp'] ?? 'Not specified',
      vacancy_employment_type: json['vacancyEmploymentType'] ?? 'Not specified',
      vacancy_description:  json['vacancyDescription'] ?? 'Not written'
    );
  }
    /*  Vacancy_id = json['VacancyId'],
        vacancy_name = json['vacancyName'],
        vacancy_salary = json['vacancySalary'],
        vacancy_employer_name = json['vacancyEmployerName'] ,
        vacancy_address = json['vacancyAddress'] ?? 'Not found',
        vacancy_requirments = json['vacancyRequirments'] ?? 'Not specified',
        vacancy_exp = json["vacancyExp"] ?? 0,
        vacancy_employment_type = json['vacancyEmploymentType'],
        vacancy_description = json['vacancyDescription'] ?? 'Description is emptyb';
*/



}