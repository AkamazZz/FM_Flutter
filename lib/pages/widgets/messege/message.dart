import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Message extends StatelessWidget {
  final bool isMe;

  final String message;


  const Message({
    Key? key, required this.isMe, required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                constraints: BoxConstraints(

          maxWidth: MediaQuery.of(context).size.width/1.25,
        ),
                decoration: BoxDecoration(
                  color: HexColor('#5325E8'),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            
            Flexible(
              child: Container(
                constraints: BoxConstraints(

                  maxWidth: MediaQuery.of(context).size.width/1.25,
                ),
                decoration: BoxDecoration(
                  color: HexColor('#9d8bd9'),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)

                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}