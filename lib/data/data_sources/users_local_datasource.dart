import 'dart:convert';

import 'package:prueba_ingreso_ceiba/core/errors/exceptions.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UsersLocalDataSource {
  Future<List<UserModel>> getLastUsers();

  Future<void> cacheUsers(List<UserModel> usersModel);
}

const CACHED_USERS = 'CACHED_USERS';

class UsersLocalDataSourceImplementation  implements UsersLocalDataSource {
  final SharedPreferences sharedPreferences;

  UsersLocalDataSourceImplementation(this.sharedPreferences);
  

  @override
  Future<void> cacheUsers(List<UserModel> usersModel) {
    return sharedPreferences.setString(CACHED_USERS, json.encode(usersModel));
  }

  @override
  Future<List<UserModel>> getLastUsers() async{
    final jsonString = sharedPreferences.getString(CACHED_USERS);
    if(jsonString != null) {
      var resBody = json.decode(jsonString);
      return Future.value(userModelFromJson(resBody));
    }else {
      throw CacheException();
    }
  }

  
}