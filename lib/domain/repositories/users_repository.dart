import 'package:dartz/dartz.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
abstract class UsersRepository {
   Future<Either<Failure,List<UserModel>>> getUsers ();
}