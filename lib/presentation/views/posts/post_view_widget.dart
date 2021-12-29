import 'package:flutter/material.dart';
import 'package:prueba_ingreso_ceiba/data/models/post_model.dart';

class PostViewWidget extends StatelessWidget {
  final List<PostModel> posts;

  const PostViewWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        key: UniqueKey(),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          final item = posts[index];
          return Column(
            children: [
              ListTile(
                title: Text(
                  item.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[700]),
                ),
                subtitle: Text(
                  item.body,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
