
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/messege/message.dart';
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


            if (index == 0) {
               return Message(message: 'BRUDFFUSFDODSDDFDSJFD DFAADFfdffdfdfdfddfdfdf', isMe: false);
            }else {
              return VacancyWidget(
                Vacancy(vacancy_exp: '0', vacancy_date_posted: DateTime(2021),
                    vacancy_salary: 300, vacancy_requirments: '0', vacancy_description: "Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur. Fugiat do aliqua laboris cillum sint dolor officia adipisicing excepteur fugiat officia. Cupidatat ut elit consequat ea laborum occaecat laborum aute consectetur Lorem exercitation. Lorem anim minim officia aliquip commodo deserunt mollit. Duis deserunt quis cillum voluptate duis ipsum quis incididunt elit excepteur excepteur labore duis cillum. Voluptate sint nulla minim eiusmod in nulla. Ea id ad duis esse adipisicing culpa ex esse ea dolore consequat. Reprehenderit eu minim veniam aliquip do ipsum duis do qui adipisicing aliquip ad occaecat.",
                    user_id: 1, vacancy_name: 'C# developer', vacancy_employment_type: 'Part-time',
                    vacancy_employer_name: 'Slave', vacancy_address: 'Astana'
                ), true);};

        },
        itemCount: 10,
        ))]))], ),));
  }
}
