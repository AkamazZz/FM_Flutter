import "dart:core";

import 'package:equatable/equatable.dart';
class Vacancy extends Equatable {
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

   Vacancy.fromJson(Map<String, dynamic> json)
      : Vacancy_id = json['VacancyId'],
        vacancy_name = json['vacancyName'],
        vacancy_salary = json['vacancySalary'],
        vacancy_employer_name = json['vacancyEmployerName'] ,
        vacancy_address = json['vacancyAddress'] ?? 'Not found',
        vacancy_requirments = json['vacancyRequirments'] ?? 'Not specified',
        vacancy_exp = json["vacancyExp"] ?? 0,
        vacancy_employment_type = json['vacancyEmploymentType'],
        vacancy_description = json['vacancyDescription'] ?? 'Description is emptyb';


  @override
  // TODO: implement props
  List<Object?> get props => [Vacancy_id, vacancy_name,vacancy_salary,vacancy_employer_name,vacancy_address,vacancy_requirments,
  vacancy_exp, vacancy_employment_type, vacancy_description];



}