


import 'package:find_master/pages/add_vacancy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateVacancyWidget extends StatelessWidget {
  const CreateVacancyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
      child:
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPageVacancy()
            ));},
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

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add_box,
                      size: 70,
                  color: Colors.deepPurpleAccent),
                  Text('Create a new Vacancy',
                      style: GoogleFonts.oswald(fontSize: 25, textStyle: Theme
                          .of(context)
                          .textTheme
                          .titleLarge)),


                ],

              ),



        ),

      ),);
  }
}
