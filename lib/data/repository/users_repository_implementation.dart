import 'package:prueba_ingreso_ceiba/core/errors/exceptions.dart';
import 'package:prueba_ingreso_ceiba/data/data_sources/users_remote_datasource.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:prueba_ingreso_ceiba/domain/repositories/users_repository.dart';

class UsersRepositoryImplementation extends UsersRepository {
  final UsersRemoteDataSource remoteDataSource;
  /* final UsersLocalDataSource localDataSource; */

  UsersRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final remoteUser = await remoteDataSource.requestUser();
      /* localDataSource.cacheUsers(remoteUser); */
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure(message: 'Server Error!'));
    }
  }
}
