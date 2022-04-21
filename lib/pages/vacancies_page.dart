
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:flutter/material.dart';

import '../common/theme_helper.dart';

class VacanciesPage extends StatelessWidget {
  VacanciesPage({Key? key}) : super(key: key);
  var vacancies = <Vacancy>[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child:
      Container(child:
      ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 50),
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
                'Yes', 300000, 'Astana', 'Astana-IT-University', true);
          }
        },
        itemCount: 10,
      ), ),),);
  }
}