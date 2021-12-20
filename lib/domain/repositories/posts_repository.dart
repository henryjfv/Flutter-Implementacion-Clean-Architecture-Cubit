import 'package:dartz/dartz.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/models/post_model.dart';
abstract class PostRepository {
   Future<Either<Failure,List<PostModel>>> getPosts (int id);
}