import 'package:flutter/material.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:prueba_ingreso_ceiba/presentation/views/users/user_details_view.dart';

class ItemCardUser extends StatelessWidget {
  final UserModel item;

  const ItemCardUser({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      fontWeight: FontWeight.bold, color: Colors.green[700]),
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
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserDetailView(item: item)))
                  },
                  child: Text(
                    "VER PUBLICACIONES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
