import 'package:get_it/get_it.dart';
import 'package:prueba_ingreso_ceiba/data/data_sources/post_remote_datasource.dart';
import 'package:prueba_ingreso_ceiba/data/data_sources/users_remote_datasource.dart';
import 'package:prueba_ingreso_ceiba/data/repository/posts_repository_implementation.dart';
import 'package:prueba_ingreso_ceiba/data/repository/users_repository_implementation.dart';
import 'package:prueba_ingreso_ceiba/domain/repositories/posts_repository.dart';
import 'package:prueba_ingreso_ceiba/domain/repositories/users_repository.dart';
import 'package:prueba_ingreso_ceiba/domain/use_cases/get_posts.dart';
import 'package:prueba_ingreso_ceiba/domain/use_cases/get_users.dart';
import 'package:prueba_ingreso_ceiba/presentation/cubit/posts/post_cubit.dart';
import 'package:prueba_ingreso_ceiba/presentation/cubit/users/user_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => UserCubit(sl()));
  sl.registerFactory(() => PostCubit(sl()));

  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => GetPosts(sl()));

  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImplementation(sl()));
  sl.registerLazySingleton<PostRepository>(() => PostsRepositoryImplementation(sl()));

  sl.registerLazySingleton<UsersRemoteDataSource>(() => UsersRemoteDataSourceImplementation(sl()));
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImplementation(sl()));

  sl.registerLazySingleton(() => http.Client());
} 