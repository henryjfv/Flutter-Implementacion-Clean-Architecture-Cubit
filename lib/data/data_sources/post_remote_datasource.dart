import 'package:prueba_ingreso_ceiba/core/errors/exceptions.dart';
import 'package:prueba_ingreso_ceiba/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> requestPost(int id);
}

class PostRemoteDataSourceImplementation implements PostRemoteDataSource {
  var client = http.Client();

  PostRemoteDataSourceImplementation(this.client);

  @override
  Future<List<PostModel>> requestPost(int id) async {
    final String url =
        'https://jsonplaceholder.typicode.com/posts?userId=' + id.toString();
    final uri = Uri.parse(url);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
