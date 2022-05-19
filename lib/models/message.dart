import 'package:equatable/equatable.dart';

class Message extends Equatable{

  final int messagesId;
  final String message;
  final int fromUserId;
  final int toUserId;
  final int vacancyId;


  const Message( this.messagesId, this.message, this.fromUserId, this.toUserId, this.vacancyId);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(json['messagesId'],
    json['message'],
    json['fromUserId'],
    json['toUserId'],
    json['vacancyId']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [messagesId, message, fromUserId, toUserId, vacancyId];

}