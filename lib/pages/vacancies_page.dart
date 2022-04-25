
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/theme_helper.dart';

class VacanciesPage extends StatelessWidget {
  VacanciesPage({Key? key}) : super(key: key);
  var _vacancies = <Vacancy>[];
  var _title = 'Favorites';
  @override
  Widget build(BuildContext context) {

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
    [Expanded(child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0 ),
        scrollDirection: Axis.vertical,

        itemBuilder: (context, index) {


            return VacancyWidget(
                'Yes', 300000, 'Astana', 'Astana-IT-University', true);

        },
        itemCount: 10,
        ))]))], ),));
  }
}
