import 'package:find_master/pages/widgets/header_widget.dart';
import 'package:find_master/repository/profile_repository.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/theme_helper.dart';
import '../models/user_info.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget{
  var profileRep = ProfileRepository();

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>{

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    {
      return FutureBuilder<UserInfo>(
          future: widget.profileRep.getProfile(),
          builder: (context,snapshot){
            if(snapshot.hasError){

              return const Center(child: Text('An error occurred'),);
            }else if (snapshot.hasData){


              return Scaffold(

                drawer: Drawer(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            colors: [
                              Theme
                                  .of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              Theme
                                  .of(context)
                                  .accentColor
                                  .withOpacity(0.5),
                            ]
                        )
                    ),

                  ),
                ),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Container(height: 100,
                          child: HeaderWidget(100, false, Icons.house_rounded),),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            children: [

                              Container(

                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person, size: 80, color: Colors.grey.shade300,),
                              ),
                              SizedBox(height: 20,),
                              Text(snapshot.data!.userName + ' ' + snapshot.data!.userSurname, style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),),


                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 4.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "User Information",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                ...ListTile.divideTiles(
                                                  color: Colors.grey,
                                                  tiles: [
                                                    ListTile(

                                                      leading: Icon(Icons.my_location),
                                                      title: Text("Location"),
                                                      subtitle: Text("Not found"),
                                                    ),
                                                    ListTile(
                                                      leading: Icon(Icons.email),
                                                      title: Text("Email"),
                                                      subtitle: Text(snapshot.data!.userEmail),
                                                    ),
                                                    ListTile(
                                                      leading: Icon(
                                                          Icons.calendar_view_day),
                                                      title: Text("Birthday"),
                                                      subtitle: Text("Not found"),
                                                    ),
                                                    ListTile(
                                                      leading: Icon(Icons.person),
                                                      title: Text("Gender"),
                                                      subtitle: Text(
                                                          "Not found"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      decoration: ThemeHelper().buttonBoxDecoration(
                                          context),
                                      child: ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                          child: Text('Log out'.toUpperCase(),
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),),
                                        ),
                                        onPressed: () async {
                                          jwtToken.clear();

                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) => LoginPage()));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }else{
              return const Center(
                child:  CircularProgressIndicator(),
              );
            }
          }
      );

    }
  }

}