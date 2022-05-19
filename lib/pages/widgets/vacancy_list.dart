

import 'dart:async';

import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy/create_vacancy.dart';
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:find_master/repository/vacancy_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

import '../../common/theme_helper.dart';

class VacancyList extends StatefulWidget {
  VacancyList({Key? key, required this.vacancies, required this.isMainPage})
      : super(key: key);
  final bool isMainPage;
  final List<Vacancy> vacancies;
  VacancyRepository vacancyRep = VacancyRepository();
  int minusVacancy = jwtToken.getBool() == true ? 2 : 1;

  final isFavorite = <bool>[].toList();

  _VacancyState createState() => _VacancyState();

}
 class _VacancyState extends State<VacancyList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var i = 0 ; i < widget.vacancies.length; i++) {
      widget.vacancyRep.isFavorite(
          jwtToken.getInt()!, widget.vacancies[i].Vacancy_id).then((
          value){
            setState(() {
              widget.isFavorite.add(value);

            });
    }
        //    print(isFavorite.toString());
      );
    }
  }
   @override
  ListView build(BuildContext context) {
     var searchController = TextEditingController();
       widget.minusVacancy = widget.isMainPage == true ? widget.minusVacancy : 0 ;
    return  ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.vertical,

      itemBuilder: (context, index) {

        if(widget.isMainPage ){
        if(index > 0 && !jwtToken.getBool()! || index >1 && jwtToken.getBool()!){
          print(widget.minusVacancy);
          print(widget.isFavorite.length);
          return VacancyWidget(

              Vacancy(vacancy_exp: widget.vacancies[index-widget.minusVacancy].vacancy_exp,
                  vacancy_salary: widget.vacancies[index-widget.minusVacancy].vacancy_salary, vacancy_requirments: widget.vacancies[index-widget.minusVacancy].vacancy_requirments,
                  vacancy_description: widget.vacancies[index-widget.minusVacancy].vacancy_requirments,
                  Vacancy_id: widget.vacancies[index-widget.minusVacancy].Vacancy_id, vacancy_name: widget.vacancies[index-widget.minusVacancy].vacancy_name, vacancy_employment_type: widget.vacancies[index-widget.minusVacancy].vacancy_employment_type,
                  vacancy_employer_name: widget.vacancies[index-widget.minusVacancy].vacancy_employer_name, vacancy_address: widget.vacancies[index-widget.minusVacancy].vacancy_address
              ), widget.isFavorite[index-widget.minusVacancy]);

        }else if (index == 1 && jwtToken.getBool()!){
          return CreateVacancyWidget();
        }
        else{

          return Container(padding: EdgeInsets.symmetric(vertical: 0),

            child: TextField(
              onSubmitted: (value) async {
                widget.vacancies.clear();
                widget.isFavorite.clear();
                widget.vacancyRep.searchVacancies(searchController.text).then((value) {
               setState(() {

              widget.vacancies.addAll(value);
               });
               widget.vacancies.forEach((element) {
                  widget.vacancyRep.isFavorite(jwtToken.getInt()!, element.Vacancy_id).then((value){
                    setState(() {
                      widget.isFavorite.add(value);

                  });});
                });
                });
              },
              controller: searchController,
              obscureText: false,
              decoration: ThemeHelper().textInputDecoration('Search', 'What do you want to search'),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          );


        }
     } else {
          return VacancyWidget(

              Vacancy(vacancy_exp: widget.vacancies[index-widget.minusVacancy].vacancy_exp,
                  vacancy_salary: widget.vacancies[index-widget.minusVacancy].vacancy_salary, vacancy_requirments: widget.vacancies[index-widget.minusVacancy].vacancy_requirments,
                  vacancy_description: widget.vacancies[index-widget.minusVacancy].vacancy_requirments,
                  Vacancy_id: widget.vacancies[index-widget.minusVacancy].Vacancy_id, vacancy_name: widget.vacancies[index-widget.minusVacancy].vacancy_name, vacancy_employment_type: widget.vacancies[index-widget.minusVacancy].vacancy_employment_type,
                  vacancy_employer_name: widget.vacancies[index-widget.minusVacancy].vacancy_employer_name, vacancy_address: widget.vacancies[index-widget.minusVacancy].vacancy_address
              ), widget.isFavorite[index-widget.minusVacancy]);
    }
        } ,

      itemCount: widget.isFavorite.length + widget.minusVacancy ,
    );
  }
}
