

import 'package:find_master/models/vacancy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme_helper.dart';


class VacancyWidget extends StatefulWidget{
   final String _vacancy_name;
   final int _salary;
   final String _where_from;
   final String _employment_type;
   bool _is_favourite;

   VacancyWidget( this._vacancy_name, this._salary, this._where_from, this._employment_type, this._is_favourite,
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
        onTap: (){ },
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
                Text(widget._vacancy_name,
                    style: GoogleFonts.oswald(fontSize: 23, textStyle: Theme
                        .of(context)
                        .textTheme
                        .headline6)),
                Text(' ' + widget._salary.toString() + " KZT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                Text(' ' + widget._where_from.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                Text(' ' + widget._employment_type.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),

              ],

            ),

            Expanded(
                child: Container(

                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [IconButton(onPressed:
                            () {
                          setState(() {
                            widget._is_favourite == true
                                ? widget._is_favourite = false
                                : widget._is_favourite = true;
                          });

                        }, icon: Icon(
                          Icons.star,
                          size: MediaQuery
                              .of(context)
                              .orientation == Orientation.portrait
                              ? MediaQuery
                              .of(context)
                              .size
                              .height / 15
                              : MediaQuery
                              .of(context)
                              .size
                              .height / 7,
                          color:
                          widget._is_favourite == true
                              ? Colors.amberAccent
                              : Colors.grey,

                        ))


                        ]
                    ))),

          ],
        ),
      ),

      ),);
  }
}


