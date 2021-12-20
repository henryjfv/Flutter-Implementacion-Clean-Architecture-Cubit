import 'package:dartz/dartz.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/models/post_model.dart';
import 'package:prueba_ingreso_ceiba/domain/repositories/posts_repository.dart';

class GetPosts {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  Future<Either<Failure, List<PostModel>>> call(int id) async{
    return postRepository.getPosts(id);
  }
}