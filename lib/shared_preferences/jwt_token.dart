import 'package:shared_preferences/shared_preferences.dart';

class jwtToken{
   static late final SharedPreferences _jwt_pref;



   static Future<SharedPreferences> init() async{
      _jwt_pref = await SharedPreferences.getInstance();
      return _jwt_pref;
   }
   static Future<bool> setString(String value) async =>
       await _jwt_pref.setString('jwt', value);

   static String? getString() =>
       _jwt_pref.getString('jwt');

}