

import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/vacancy_page.dart';
import 'package:find_master/pages/widgets/vacancy/star.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme_helper.dart';


class VacancyWidget extends StatefulWidget{
   final Vacancy vacancy;

   bool _is_favourite;

   VacancyWidget(this.vacancy, this._is_favourite,
   {Key? key}
   ) : super(key: key);
   @override
   State<VacancyWidget> createState() => _VacancyWidgetState();


  }





class _VacancyWidgetState extends State<VacancyWidget> {
  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child:
      GestureDetector(
        onTap: (){
          print( 'yesss'+widget.vacancy.Vacancy_id.toString());

          Navigator.push(context, MaterialPageRoute(builder: (context) => VacancyPage(vacancy: widget.vacancy,
            isFavorite: widget._is_favourite ))); },
        child:
      Container(

        padding: EdgeInsets.only(left: 10),
        height: MediaQuery
            .of(context)
            .orientation == Orientation.portrait
            ? MediaQuery
            .of(context)
            .size
            .height / 5
            : MediaQuery
            .of(context)
            .size
            .height / 2.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]
        ),


        child:

        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),

            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.vacancy.vacancy_name,
                    style: GoogleFonts.oswald(fontSize: 23, textStyle: Theme
                        .of(context)
                        .textTheme
                        .headline6)),
                Text(' ' + widget.vacancy.vacancy_salary.toString() + " KZT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                Text(' ' + widget.vacancy.vacancy_address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                Text(' ' + widget.vacancy.vacancy_employment_type,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),

              ],

            ),
            starWidget(widget.vacancy.Vacancy_id, jwtToken.getBool()!, widget._is_favourite ),

          ],
        ),
      ),

      ),);
  }
}


