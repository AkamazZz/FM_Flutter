


import 'package:find_master/pages/widgets/messege/message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tamerlan', style: GoogleFonts.openSans(fontSize: 30, textStyle: Theme
            .of(context)
            .textTheme
            .headline6),
            textAlign: TextAlign.center ),

        backgroundColor: Colors.grey.withOpacity(0.2),
        elevation: 0,
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            )),


      ),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }
  Widget getBottom(){
    return Container(
      height: MediaQuery.of(context).size.height/12,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2)
      ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: <Widget>[

            Container(


              child: Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width)/1.25,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        cursorColor: Colors.black,

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",

                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Icon(Icons.thumb_up,size: 35,color: HexColor('#5325E8'),),
                ],
              ),
            ),



          ],
        ),

    );
  }

  Widget getBody() {

    return ListView(
      padding: EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 80),
      children: List.generate(1, (index){
        return Message(isMe: false,message: "DFGFJOGFDGNDFJGDFNGFDJGNFDGKJDFNGDFJKGD DFNG GJNGDFKJGNDFGDFNGDFGJDFN");
      }),
    );
  }
}



