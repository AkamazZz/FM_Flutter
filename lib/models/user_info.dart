import 'package:equatable/equatable.dart';

class UserInfo extends Equatable{

  final int userId;
  final String userName;
  final String userSurname;
  /*String? userNumber;
  String? userAddress;
  String? userBirthDay;
  bool? isWoman;
  String? skills;
  String? workExp;*/

  const UserInfo(this.userId, this.userName, this.userSurname);

  UserInfo.fromJson(Map<String, dynamic> json)
      : userId = json['UserId'],
        userName = json['UserName'],
        userSurname = json['UserSurname'];

  @override
  // TODO: implement props
  List<Object?> get props => [userId, userName, userSurname];

}