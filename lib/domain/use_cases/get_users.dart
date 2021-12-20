import 'package:dartz/dartz.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:prueba_ingreso_ceiba/domain/repositories/users_repository.dart';

class GetUsers {
  final UsersRepository usersRepository;

  GetUsers(this.usersRepository);

  Future<Either<Failure, List<UserModel>>> call() async{
    return usersRepository.getUsers();
  }
}