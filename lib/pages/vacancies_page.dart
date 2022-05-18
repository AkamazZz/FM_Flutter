
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/messege/message.dart';
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy_list.dart';
import 'package:find_master/repository/vacancy_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/theme_helper.dart';

class VacanciesPage extends StatelessWidget {
  final bool isEmployer;
  VacanciesPage({Key? key, required this.isEmployer}) : super(key: key);
  var vacancyRep = VacancyRepository();
  @override
  Widget build(BuildContext context) {
    var _title = isEmployer == true ? 'Applications' : 'Favorites' ;
    return

      Scaffold(appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        title: Text(_title, style: GoogleFonts.openSans(fontSize: 30, textStyle: Theme
            .of(context)
            .textTheme
            .headline6),
            textAlign: TextAlign.center ),
        centerTitle: true,



      ),
      body:
      SafeArea(child:
      Column(children:[ /*Material(
        elevation: 10,
        shadowColor: Colors.grey.withOpacity(0.5),
        child:
        Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height/12
          : MediaQuery.of(context).size.height/6,
        padding: EdgeInsets.only(top: 0),
          child: Center(child:
          Text(
        _title,
        style:  GoogleFonts.openSans(fontSize: 30, textStyle: Theme
              .of(context)
              .textTheme
              .headline6),
            textAlign: TextAlign.center,


      ))),
         )
      ,*/ Expanded(

            child:
    Column(children:
    [Expanded(child: FutureBuilder<List<Vacancy>>(
        future: isEmployer == true ? vacancyRep.fetchApplications()
            : vacancyRep.fetchFavorites(),
        builder: (context,snapshot){
          if(snapshot.hasError){

            return const Center(child: Text('An error occurred'),);
          }else if (snapshot.hasData){
            
            return VacancyList(vacancies: snapshot.data!, isMainPage: false);
          }else{
            return const Center(
              child:  CircularProgressIndicator(),
            );
          }
        }
    ))]))], ),));
  }
}
