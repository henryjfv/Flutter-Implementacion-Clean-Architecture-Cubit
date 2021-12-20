import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_ingreso_ceiba/core/errors/failure.dart';
import 'package:prueba_ingreso_ceiba/data/models/post_model.dart';
import 'package:prueba_ingreso_ceiba/domain/use_cases/get_posts.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPosts getPosts;

  PostCubit(this.getPosts) : super(PostInitial());

  void getPostUser(int id) async {
    emit(PostLoading());
    final failureOrpPost = await getPosts(id);
    emit(_failureOrPost(failureOrpPost));
  }

  PostState _failureOrPost(Either<Failure, List<PostModel>> failureOrPost) {
    return failureOrPost.fold(
        (failure) => PostError(_mapFailureToMessage(failure)),
        (postModel) => PostLoaded(postModel));
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
