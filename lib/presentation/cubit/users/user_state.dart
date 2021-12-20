part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UserState {}

class UsersLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<UserModel> users;

  UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UsersError extends UserState {
  final String message;

  UsersError(this.message);
  @override
  List<Object> get props => [message];
}
