


import 'package:find_master/models/user_info.dart';
import 'package:find_master/pages/message_page.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/user_dto.dart';

class EmployerWidget extends StatelessWidget {

  final UserDTO user;
  final int vacancyId;
  const EmployerWidget( this.user, this.vacancyId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child:
      GestureDetector(
        onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage(jwtToken.getInt()!,user.userId, vacancyId
            , user.userName))); },
        child:
        Container(

          padding: EdgeInsets.only(left: 10),
          height: MediaQuery
              .of(context)
              .orientation == Orientation.portrait
              ? MediaQuery
              .of(context)
              .size
              .height / 10
              : MediaQuery
              .of(context)
              .size
              .height / 5,
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
                  Text(user.userName + '' + user.userSurname,
                      style: GoogleFonts.oswald(fontSize: 23, textStyle: Theme
                          .of(context)
                          .textTheme
                          .headline6)),

                ],

              ),

            ],
          ),
        ),

      ),);
 /*   return Container(

      color: Colors.white60,

      child: Material(
        shadowColor: Colors.black12,
        child: ListTile(
          textColor: Colors.black,
          tileColor: Colors.blue,
          title: Text(user.userName + ' ' + user.userSurname, style:
          GoogleFonts.openSans(fontSize: 20, textStyle: Theme
              .of(context)
              .textTheme
              .headline6)),

       onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage(1))); },
        ),

    )
    );*/
  }
}
