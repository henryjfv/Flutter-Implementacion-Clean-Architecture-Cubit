import 'package:equatable/equatable.dart';

class Post extends Equatable{
    Post({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    final int userId;
    final int id;
    final String title;
    final String body;

  @override
  List<Object> get props => [userId, id, title, body];
}
