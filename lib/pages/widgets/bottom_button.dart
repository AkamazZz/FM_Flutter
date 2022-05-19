

import 'package:find_master/repository/vacancy_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';

import '../message_page.dart';

class BottomButton extends StatelessWidget {
  final int vacancyId;
  final rep = VacancyRepository();
  BottomButton(this.vacancyId , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Align(
        alignment: Alignment.bottomCenter,
        child: MaterialButton(
          color: Colors.deepPurple,
          textColor: Colors.white,
          minWidth: 300,
          onPressed: () => {
            rep.getEmployeeId(vacancyId).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage(jwtToken.getInt()!,
                value, vacancyId, 'SapaSoft' ))))

          },
          child: const Text('Write'),
        ),
      );

  }
}
