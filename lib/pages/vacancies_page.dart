
import 'package:find_master/pages/widgets/vacancy/vacancy.dart';
import 'package:flutter/material.dart';

class VacanciesPage extends StatelessWidget {
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return VacancyWidget('Niger', 300000,'Nigeria','Astana-IT-University', true);
      },
      itemCount: 10,
    );
  }
}
