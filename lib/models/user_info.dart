import 'package:equatable/equatable.dart';

class UserInfo extends Equatable{

  final int userId;
  final String userName;
  final String userSurname;
  final String userEmail;

  /*String? userNumber;
  String? userAddress;
  String? userBirthDay;
  bool? isWoman;
  String? skills;
  String? workExp;*/

  const UserInfo( this.userId,this.userName, this.userSurname, this.userEmail);

   factory UserInfo.fromJson(Map<String, dynamic> json) {
     return UserInfo(
          json['userId']
           ,json['userName']
         , json['userSurname'],
         json['userEmail'] );
   }

  @override
  // TODO: implement props
  List<Object?> get props => [ userId,userName, userSurname, userEmail];

}