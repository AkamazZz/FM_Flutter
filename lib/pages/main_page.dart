
import 'dart:async';

import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy_list.dart';
import 'package:find_master/repository/vacancy_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

import '../common/theme_helper.dart';
import '../models/vacancy.dart';


class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  var vacancyRep = VacancyRepository();

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    widget.vacancyRep.fetchVacancies();
  }
  @override
  Widget build(BuildContext context) {
    // print(jwtToken.getInt());
    return
      Scaffold(
          body:
          SafeArea(child:

          Container(child:
          FutureBuilder<List<Vacancy>>(
            future: widget.vacancyRep.fetchVacancies(),
            builder: (context,snapshot){
              if(snapshot.hasError){

                return const Center(child: Text('An error occurred'),);
              }else if (snapshot.hasData){


                return VacancyList(vacancies: snapshot.data!, isMainPage: true);
              }else{
                return const Center(
                  child:  CircularProgressIndicator(),
                );
              }
            }
          )
          ),));
  }
}
