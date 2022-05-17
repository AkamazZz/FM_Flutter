import 'package:shared_preferences/shared_preferences.dart';

class jwtToken{
   static late final SharedPreferences _jwt_pref;



   static Future<SharedPreferences> init() async{
      _jwt_pref = await SharedPreferences.getInstance();
      return _jwt_pref;
   }
   static Future<bool> setString(String value) async =>
       await _jwt_pref.setString('jwt', value);

   static Future<bool> setInt(int value) async =>
      await _jwt_pref.setInt('id', value );
   static Future<bool> setBool(bool value) async =>
      await _jwt_pref.setBool('isEmployer', value);
   static bool? getBool() =>
      _jwt_pref.getBool('isEmployer');

   static String? getString() =>
       _jwt_pref.getString('jwt') ?? 'empty';
   static int? getInt() =>
       _jwt_pref.getInt('id');
   static void clear() =>
       _jwt_pref.clear();

}