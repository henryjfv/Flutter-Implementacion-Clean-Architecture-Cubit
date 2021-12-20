import 'package:dartz/dartz.dart';
import 'package:prueba_ingreso_ceiba/core/errors/exceptions.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/data_sources/post_remote_datasource.dart';
import 'package:prueba_ingreso_ceiba/data/models/post_model.dart';
import 'package:prueba_ingreso_ceiba/domain/repositories/posts_repository.dart';

class PostsRepositoryImplementation extends PostRepository {
  final PostRemoteDataSource remoteDataSource;
/*   final PostsLocalDataSource localDataSource;
  final NetworkInfo networkInfo; */

  PostsRepositoryImplementation(
      this.remoteDataSource /* , this.localDataSource, this.networkInfo */);

  @override
  Future<Either<Failure, List<PostModel>>> getPosts(int id) async {
    try {
      final remoteUser = await remoteDataSource.requestPost(id);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure(message: 'Server Error!'));
    }
  }
}
