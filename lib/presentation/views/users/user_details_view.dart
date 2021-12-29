import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:prueba_ingreso_ceiba/injection_container.dart';
import 'package:prueba_ingreso_ceiba/presentation/cubit/posts/post_cubit.dart';
import 'package:prueba_ingreso_ceiba/presentation/views/posts/post_view_widget.dart';
import 'package:prueba_ingreso_ceiba/presentation/views/widgets/loading_widget.dart';

class UserDetailView extends StatelessWidget {
  final UserModel item;

  const UserDetailView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba ingreso Ceiba'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        item.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700]),
                      ),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 15.5,
                                  color: Colors.green[700],
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  item.phone,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              children: [
                                Icon(
                                  Icons.email,
                                  size: 15.5,
                                  color: Colors.green[700],
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  item.email,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocProvider(
                      create: (context) => sl<PostCubit>(),
                      child: BlocBuilder<PostCubit, PostState>(
                          builder: (context, state) {
                        if (state is PostInitial) {
                          _getPost(context, item.id);
                          return LoadingWidget();
                        } else if (state is PostLoaded) {
                          final posts = state.posts;
                          return PostViewWidget(posts: posts);
                        } else if (state is PostLoading) {
                          return LoadingWidget();
                        } else {
                          return Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Text('Error!'),
                                  ElevatedButton(
                                    onPressed: null,
                                    child: Text('Reload'),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getPost(BuildContext context, int id) async {
    final userCubit = context.read<PostCubit>();
    userCubit.getPostUser(id);
  }
}
