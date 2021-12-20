import 'package:prueba_ingreso_ceiba/core/errors/exceptions.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UsersRemoteDataSource {
  Future<List<UserModel>> requestUser();
}

class UsersRemoteDataSourceImplementation implements UsersRemoteDataSource {
  var client = http.Client();

  UsersRemoteDataSourceImplementation(this.client);

  @override
  Future<List<UserModel>> requestUser() async {
    final String url = 'https://jsonplaceholder.typicode.com/users';
    final uri = Uri.parse(url);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
