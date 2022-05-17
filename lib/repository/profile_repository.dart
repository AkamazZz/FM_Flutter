import 'package:dio/dio.dart';
import 'package:find_master/shared_preferences/jwt_token.dart';
import 'package:find_master/extensions/BoolParsing.dart';
import 'api_constants.dart';

class ProfileRepository{
  final Dio _dio = Dio(BaseOptions(

    responseType: ResponseType.plain,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  ));
  var url = "${ApiConstants.mainUrl}Profile/";
  
  Future<bool> isEmployer (int id) async{
    final res = await _dio.get(url + 'Is_Employeer?UserId=$id');
    if(res.statusCode == 200){
      jwtToken.setBool(res.data.toString().ParseBool());
      return res.data.ParseBool();
    }else{
      throw Exception('Wrong format');
    }
  }
}