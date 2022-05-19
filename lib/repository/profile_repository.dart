import 'package:dio/dio.dart';
import 'package:find_master/repository/dioConfiguration.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:find_master/extensions/BoolParsing.dart';
import '../models/user_info.dart';
import 'api_constants.dart';

class ProfileRepository{
  final Dio _dio = Dio(dioConfiguration.conf);
  var url = "${ApiConstants.mainUrl}Profile/";
  
  Future<bool> isEmployer (int id) async{
    final res = await _dio.get(url + 'Is_Employeer?UserId=$id');
    if(res.statusCode == 200){
      jwtToken.setBool(res.data.toString().ParseBool());
      return res.data.toString().ParseBool();
    }else{
      throw Exception('Wrong format');
    }
  }
  Future<List<UserInfo>> getProfile() async{
    final res = await _dio.get(url + jwtToken.getInt()!.toString());
    return parseUser(res);
  }


  List<UserInfo> parseUser(Response response) {


    return (response.data as List).map<UserInfo>((json) => UserInfo.fromJson(json)).toList();
  }
}