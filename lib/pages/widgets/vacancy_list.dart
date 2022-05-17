

import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

import '../../common/theme_helper.dart';

class VacancyList extends StatelessWidget {
  const VacancyList({Key? key, required this.vacancies}) : super(key: key);
  final List<Vacancy> vacancies;

  @override
  ListView build(BuildContext context) {
    return  ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.vertical,

      itemBuilder: (context, index) {
        if(index == 0 ){
          return Container(padding: EdgeInsets.symmetric(vertical: 0),

            child: TextField(
              obscureText: false,
              decoration: ThemeHelper().textInputDecoration('Search', 'What do you want to search'),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          );
        } else {
          return VacancyWidget(

              Vacancy(vacancy_exp: vacancies[index].vacancy_exp,
                  vacancy_salary: vacancies[index].vacancy_salary, vacancy_requirments: vacancies[index].vacancy_requirments, vacancy_description: vacancies[index].vacancy_requirments,
                  Vacancy_id: vacancies[index].Vacancy_id, vacancy_name: vacancies[index].vacancy_name, vacancy_employment_type: vacancies[index].vacancy_employment_type,
                  vacancy_employer_name: vacancies[index].vacancy_employer_name, vacancy_address: vacancies[index].vacancy_address
              ), jwtToken.getBool()!);
        }
      },
      itemCount: vacancies.length+2 ,
    );
  }
}
