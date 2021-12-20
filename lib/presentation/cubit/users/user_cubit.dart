import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:prueba_ingreso_ceiba/domain/use_cases/get_users.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsers getUser;

  UserCubit(this.getUser) : super(UsersInitial());

  void getNewUser() async {
    emit(UsersLoading());
    final failureOrUser = await getUser();
    emit(_failureOrUser(failureOrUser));
  }

  UserState _failureOrUser(Either<Failure, List<UserModel>> failureOrUser) {
    return failureOrUser.fold(
        (failure) => UsersError(_mapFailureToMessage(failure)),
        (userModel) => UsersLoaded(userModel));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error!. Please try again!';
      default:
        return 'Unexpected error';
    }
  }
}
