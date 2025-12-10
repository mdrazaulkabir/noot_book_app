import 'dart:convert';

import 'package:note_book_app/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static UserModel? userData;
  static String? userToken;
  static Future<void> saveUserData(UserModel model,String token)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString('user_data', jsonEncode(model.toJson()));
    await sharedPreferences.setString('user_token', token);
  }
  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    userData=UserModel.fromJson(jsonDecode(sharedPreferences.getString('user_data')!));
    userToken=sharedPreferences.getString('user_token');
  }

  static Future<bool> userLogin()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? token=sharedPreferences.getString('user_token');
    if(token!=null){
      await getUserData();
      return true;
    }
    else {
      return false;
    }
  }
  static Future<void> clearData()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}