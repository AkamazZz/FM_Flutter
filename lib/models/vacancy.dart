import "dart:core";
class Vacancy {
  final int user_id;
  final String vacancy_name;
  final int vacancy_salary;
  final String vacancy_employer_name;
  final String vacancy_address;
  final String vacancy_requirments;
  final String vacancy_exp;
  final String vacancy_employment_type;
  final String vacancy_description;
  final DateTime vacancy_date_posted;

  Vacancy({required this.user_id, required this.vacancy_name, required this.vacancy_employer_name,
      required this.vacancy_address, required this.vacancy_requirments, required this.vacancy_exp,
      required this.vacancy_employment_type, required this.vacancy_description,
      required this.vacancy_date_posted, required this.vacancy_salary});

  Vacancy.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        vacancy_name = json['vacancy_name'],
        vacancy_salary = json['vacancy_salary'],
        vacancy_employer_name = json['vacancy_employer_name'],
        vacancy_address = json['vacancy_address'],
        vacancy_requirments = json['vacancy_requirments'],
        vacancy_exp = json["vacancy_experience"],
        vacancy_employment_type = json['vacancy_employment_type'],
        vacancy_description = json['vacancy_description'],
        vacancy_date_posted = json['vacancy_date_posted'];
}