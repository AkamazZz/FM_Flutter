


import 'package:find_master/repository/vacancy_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

class starWidget extends StatefulWidget {
  bool isApplication;
  int vacancyId;
  bool isFavorite;

  VacancyRepository vacancyRep = VacancyRepository();
  starWidget(this.vacancyId,this.isApplication, this.isFavorite, {Key? key}) : super(key: key);

  @override
  State<starWidget> createState() => _starWidgetState();
}

class _starWidgetState extends State<starWidget> {

  @override
  Widget build(BuildContext context) {

    if(!widget.isApplication){
      return Expanded(

          child: Container(

              padding: const EdgeInsets.only(right: 30),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [IconButton(onPressed:
                      () {
                      if(!widget.isFavorite) {
                        widget.vacancyRep.addFavorite(
                            jwtToken.getInt()!, widget.vacancyId);
                      }else{
                        widget.vacancyRep.deleteFavorite(
                            jwtToken.getInt()!, widget.vacancyId);
                      }
                    setState(() {
                      widget.isFavorite == true
                          ? widget.isFavorite = false
                          : widget.isFavorite = true;
                    },
                    );

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
                    widget.isFavorite == true
                        ? Colors.amberAccent
                        : Colors.grey,

                  ))


                  ]
              )));
    }
    else{
      return Container();
    }
  }
}
