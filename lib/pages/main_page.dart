
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

import '../common/theme_helper.dart';
import '../models/vacancy.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // print(jwtToken.getInt());
    return
      Scaffold(
          body:
      SafeArea(child:
      Container(child:
      ListView.builder(
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
          }else {
            return VacancyWidget(

                Vacancy(vacancy_exp: '0',
                    vacancy_salary: 300, vacancy_requirments: '0', vacancy_description: "Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur. Fugiat do aliqua laboris cillum sint dolor officia adipisicing excepteur fugiat officia. Cupidatat ut elit consequat ea laborum occaecat laborum aute consectetur Lorem exercitation. Lorem anim minim officia aliquip commodo deserunt mollit. Duis deserunt quis cillum voluptate duis ipsum quis incididunt elit excepteur excepteur labore duis cillum. Voluptate sint nulla minim eiusmod in nulla. Ea id ad duis esse adipisicing culpa ex esse ea dolore consequat. Reprehenderit eu minim veniam aliquip do ipsum duis do qui adipisicing aliquip ad occaecat.",
                    Vacancy_id: 1, vacancy_name: 'C# developer', vacancy_employment_type: 'Part-time',
                    vacancy_employer_name: 'Slave', vacancy_address: 'Astana'
                ), true);
          }
        },
        itemCount: 10,
      ), ),));
  }
}
