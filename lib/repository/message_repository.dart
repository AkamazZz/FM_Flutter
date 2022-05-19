import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:find_master/extensions/BoolParsing.dart';
import 'package:find_master/models/message.dart';
import 'package:find_master/models/user_dto.dart';
import 'package:find_master/models/user_info.dart';
import 'package:find_master/models/vacancy.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:flutter/foundation.dart';
import 'dioConfiguration.dart';
import 'api_constants.dart';


class MessageRepository{
  final Dio _dio = Dio(dioConfiguration.conf);
  var url = "${ApiConstants.mainUrl}Message/";

  Future<List<UserInfo>> fetchSenders() async {

    Response response = await _dio.get(url + 'Get_Chat_List_Employer?ToUserId=${jwtToken.getInt()!}');
    return parseUser(response);
  }
  Future<List<Message>> fetchChat(int fromUserId, int toUserId, int vacancyId) async {
      print(fromUserId.toString() + ' yes ' + toUserId.toString()  + ' ' + vacancyId.toString());
    Response response = await _dio.get(url + 'Get_Chat?FromUserId=$fromUserId&ToUserId=$toUserId&VacancyId=$vacancyId');
    print('era gay fetch chat' + response.statusCode.toString() + response.data.toString());

    return parseMessage(response);
  }

  Future<Response> sendMessage(String message, int fromUserId, int toUserId, int vacancyId) async{
    Response response = await _dio.post( url + 'Send_Message?FromUserId=$fromUserId&ToUserId=$toUserId&message=$message&VacancyId=$vacancyId');
    print('era gay status code' + response.statusCode.toString());
    return response;
  }
  Future<List<UserDTO>> getSenders(int vacancyId) async{
    Response response = await _dio.get(url + 'Get_Chat_List_Employer?ToUserId=${jwtToken.getInt()!}&VacancyId=$vacancyId');
    print('senders: ' + response.data.toString());
    return parseUsers(response);
  }
  List<Message> parseMessage(Response response){
    return (response.data as List).map<Message>((json) => Message.fromJson(json)).toList();
  }


  List<UserInfo> parseUser(Response response) {


    return (response.data as List).map<UserInfo>((json) => UserInfo.fromJson(json)).toList();
  }
  List<UserDTO> parseUsers(Response response){
    return (response.data as List).map<UserDTO>((json) => UserDTO.fromJson(json)).toList();
  }
}