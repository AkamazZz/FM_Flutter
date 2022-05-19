import 'package:equatable/equatable.dart';

class UserDTO extends Equatable{

  final int userId;
  final String userName;
  final String userSurname;
  final String message;

  /*String? userNumber;
  String? userAddress;
  String? userBirthDay;
  bool? isWoman;
  String? skills;
  String? workExp;*/

  const UserDTO( this.userId,this.userName, this.userSurname, this.message);

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
        json['userId']
        ,json['name']
        , json['surname'],
        json['message'] );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ userId,userName, userSurname, message];

}