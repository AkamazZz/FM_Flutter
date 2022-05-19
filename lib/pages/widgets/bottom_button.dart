

import 'package:flutter/material.dart';

import '../message_page.dart';

class BottomButton extends StatelessWidget {
  final int vacancyId;
  const BottomButton(this.vacancyId,{Key? key}) : super(key: key);

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagePage(1)))
          },
          child: const Text('Write'),
        ),
      );

  }
}
