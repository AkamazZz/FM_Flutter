import 'package:equatable/equatable.dart';

class UserInfo extends Equatable{


  final String userName;
  final String userSurname;

  /*String? userNumber;
  String? userAddress;
  String? userBirthDay;
  bool? isWoman;
  String? skills;
  String? workExp;*/

  const UserInfo( this.userName, this.userSurname);

   factory UserInfo.fromJson(Map<String, dynamic> json) {
     return UserInfo(json['userName'], json['userSurname']);
   }

  @override
  // TODO: implement props
  List<Object?> get props => [ userName, userSurname];

}