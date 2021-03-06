


import 'package:find_master/models/vacancy.dart';
import 'package:find_master/pages/widgets/bottom_button.dart';
import 'package:find_master/pages/widgets/vacancy/employer.dart';
import 'package:find_master/repository/message_repository.dart';
import 'package:find_master/repository/vacancy_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';

import '../models/user_dto.dart';
import '../models/user_info.dart';

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;
  bool isFavorite;
  bool isEmployer = false;
  VacancyPage({Key? key, required this.vacancy, required this.isFavorite}) : super(key: key);

  var vacancyRep = VacancyRepository();
  var messageRep = MessageRepository();

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      backgroundColor: Colors.grey.shade50,

      iconTheme: IconThemeData(

        color: Colors.black54,
      ) ,
      actions: [!jwtToken.getBool()! ? IconButton(
        iconSize: 40,
        splashRadius: 10,
          onPressed:
          () {
            if(!widget.isFavorite) {
              widget.vacancyRep.addFavorite(
                  jwtToken.getInt()!, widget.vacancy.Vacancy_id);
            }else{
              widget.vacancyRep.deleteFavorite(
                  jwtToken.getInt()!, widget.vacancy.Vacancy_id);
            }
        setState(() {
          widget.isFavorite == true
              ? widget.isFavorite = false
              : widget.isFavorite = true;
        } );

      }, icon: Icon(
        Icons.star,
        size: 40,
        color:
        widget.isFavorite == true
            ? Colors.amberAccent
            : Colors.grey,

      ))
          : Container()],

    ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, top: 5),
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.vacancy.vacancy_address.isEmpty
                          ? 'No info about address'
                          : widget.vacancy.vacancy_address,
                      style: GoogleFonts.openSans(fontSize: 15, color: Colors.black54, textStyle: Theme
                          .of(context)
                          .textTheme
                          .headline6)),

                  Container(
                    padding: EdgeInsets.only(top:5),
                    child: Text(
                        widget.vacancy.vacancy_name.isEmpty
                            ? 'Not provided vacancy name'
                            : widget.vacancy.vacancy_name,
                        style: GoogleFonts.openSans(fontSize: 20,  textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline6)
                    )
                    ,
                  ),
                  Text(
                      widget.vacancy.vacancy_salary.toString() + ' KZT',
                      style: GoogleFonts.openSans(fontSize: 20,  textStyle: Theme
                          .of(context)
                          .textTheme
                          .headline6)

                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                        widget.vacancy.vacancy_exp.isEmpty
                            ?  'Experience: 0 years'
                            :  'Experience: ' + widget.vacancy.vacancy_exp + ' Years',
                        style: GoogleFonts.openSans(fontSize: 15, color: Colors.black54,  textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline6)
                    ),
                  ),
                  Text(
                      widget.vacancy.vacancy_employment_type.isEmpty
                          ? 'unknown employment '
                          : widget.vacancy.vacancy_employment_type + ' employment',
                      style: GoogleFonts.openSans(fontSize: 15, color: Colors.black54,  textStyle: Theme
                          .of(context)
                          .textTheme
                          .headline6)
                  ),
                ],

              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 15, top: 5),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('Employer',
                        style: GoogleFonts.openSans(fontSize: 16  , color: Colors.black54,  textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline6)),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        widget.vacancy.vacancy_employer_name ,
                        style: GoogleFonts.openSans(fontSize: 18,  textStyle: Theme
                            .of(context)
                            .textTheme
                            .titleLarge)
                    ),
                  ),
                  Divider(
                    color: Colors.black54,
                    height: 2,
                    thickness: 0.8,

                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        widget.vacancy.vacancy_description,
                        style: GoogleFonts.openSans(fontSize: 17,  textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline4)
                    ),
                  ),
                  !jwtToken.getBool()!
                      ?  BottomButton(widget.vacancy.Vacancy_id)
                      : FutureBuilder<List<UserDTO>>(
                      future: widget.messageRep.getSenders(widget.vacancy.Vacancy_id),
                      builder: (context,snapshot){
                         if (snapshot.connectionState == ConnectionState.done){
                          if(snapshot.hasData){
                            print('HAS DATA');

                          return ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            scrollDirection: Axis.vertical,

                            itemBuilder: (context, index) {


                                  print(snapshot.data![index].userName);
                                  return EmployerWidget(snapshot.data![index], widget.vacancy.Vacancy_id);






                                },



                            itemCount: snapshot.data!.length ,
                          );
                        }else if (snapshot.hasError){
                            return Container(height: 10000, width:  10000,color: Colors.deepPurpleAccent,);
                          }else{
                            return Container(height: 10000, width:  10000,color: Colors.black);

                          }
    }else{

                           return const Center(
                             child:  CircularProgressIndicator(),
                           );
                         }
                      }
                  ),


                ],
              ),
            )],
        )
      ),
    );
  }

}
