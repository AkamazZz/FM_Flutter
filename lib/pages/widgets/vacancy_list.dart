

import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

import '../../common/theme_helper.dart';

class VacancyList extends StatelessWidget {
   VacancyList({Key? key, required this.vacancies, required this.isMainPage}) : super(key: key);
   final bool isMainPage;
  final List<Vacancy> vacancies;

   int minusVacancy = jwtToken.getBool() == true ? 2 : 1 ;

  @override
  ListView build(BuildContext context) {
    minusVacancy = isMainPage == true ? minusVacancy : 0 ;
    return  ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.vertical,

      itemBuilder: (context, index) {
        if(isMainPage){
        if(index == 0 ){
          return Container(padding: EdgeInsets.symmetric(vertical: 0),

            child: TextField(
              obscureText: false,
              decoration: ThemeHelper().textInputDecoration('Search', 'What do you want to search'),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          );
        }else if (index == 1 && jwtToken.getBool()!){
          return Container(padding: EdgeInsets.symmetric(vertical: 0),

            child: TextField(
              obscureText: false,
              decoration: ThemeHelper().textInputDecoration('Search', 'What do you want to search'),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          );
        }
        else {
          return VacancyWidget(

              Vacancy(vacancy_exp: vacancies[index-minusVacancy].vacancy_exp,
                  vacancy_salary: vacancies[index-minusVacancy].vacancy_salary, vacancy_requirments: vacancies[index-minusVacancy].vacancy_requirments, vacancy_description: vacancies[index-minusVacancy].vacancy_requirments,
                  Vacancy_id: vacancies[index-minusVacancy].Vacancy_id, vacancy_name: vacancies[index-minusVacancy].vacancy_name, vacancy_employment_type: vacancies[index-minusVacancy].vacancy_employment_type,
                  vacancy_employer_name: vacancies[index-minusVacancy].vacancy_employer_name, vacancy_address: vacancies[index-minusVacancy].vacancy_address
              ), jwtToken.getBool()!);
        }
     } else {
    return VacancyWidget(

    Vacancy(vacancy_exp: vacancies[index-minusVacancy].vacancy_exp,
    vacancy_salary: vacancies[index-minusVacancy].vacancy_salary, vacancy_requirments: vacancies[index-minusVacancy].vacancy_requirments, vacancy_description: vacancies[index-minusVacancy].vacancy_requirments,
    Vacancy_id: vacancies[index-minusVacancy].Vacancy_id, vacancy_name: vacancies[index-minusVacancy].vacancy_name, vacancy_employment_type: vacancies[index-minusVacancy].vacancy_employment_type,
    vacancy_employer_name: vacancies[index-minusVacancy].vacancy_employer_name, vacancy_address: vacancies[index-minusVacancy].vacancy_address
    ), jwtToken.getBool()!);
    }
        } ,

      itemCount: vacancies.length +  minusVacancy  ,
    );
  }
}
