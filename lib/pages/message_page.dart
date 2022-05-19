


import 'package:find_master/models/message.dart';
import 'package:find_master/pages/widgets/messege/message.dart';
import 'package:find_master/repository/message_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MessagePage extends StatefulWidget {
  final int receiverId;
  final int senderId;
  final int vacancyId;
  final String name;
  final messageRep = MessageRepository();
  MessagePage(this.senderId,this.receiverId , this.vacancyId, this.name , {Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name, style: GoogleFonts.openSans(fontSize: 30, textStyle: Theme
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
      body: FutureBuilder<List<Message>>(
    future: widget.messageRep.fetchChat(widget.senderId, widget.receiverId, widget.vacancyId),
      builder: (context,snapshot){
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return const Center(child: Text('An error occurred'),);
      } else {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 15),
          scrollDirection: Axis.vertical,

          itemBuilder: (context, index) {
            return MessagePod(
                isMe:  jwtToken.getInt()! == snapshot.data![index].toUserId ? false : true
            , message: snapshot.data![index].message);
          },
          itemCount: snapshot.data!.length,
        );
      }
    }
    else{
    return const Center(
    child:  CircularProgressIndicator(),
    );
    }

    }),
      bottomSheet: getBottom(),
    );

  }
  Widget getBottom(){
    var messageController = TextEditingController();
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
                        controller: messageController,
                        cursorColor: Colors.black,

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",

                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  IconButton(icon: Icon(Icons.send,size: 35,color: HexColor('#5325E8'),),
                  onPressed: () async {
                      widget.messageRep.sendMessage(messageController.text, widget.senderId, widget.receiverId,
                      widget.vacancyId).then((value) {
                        if(value.statusCode != 400 || value.statusCode != 500){
                          print('Era gay');
    }
                        setState(() {
                          messageController.clear();

                        });

                      });
                  },),
                ],
              ),
            ),



          ],
        ),

    );
  }


}



