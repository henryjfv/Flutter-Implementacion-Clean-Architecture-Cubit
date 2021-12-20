import 'package:flutter/material.dart';
import 'package:prueba_ingreso_ceiba/data/models/user_model.dart';
import 'package:prueba_ingreso_ceiba/presentation/views/widgets/item_user_card.dart';

class ListViewUser extends StatefulWidget {
  List<UserModel> users;

  ListViewUser({Key key, this.users}) : super(key: key);

  @override
  State<ListViewUser> createState() => _ListViewUserState();
}

class _ListViewUserState extends State<ListViewUser> {
  List<UserModel> usersfilter = [];
  List<UserModel> usersTemp;

  @override
  Widget build(BuildContext context) {
    TextEditingController _queryController;
    usersTemp = widget.users;
    usersfilter = usersfilter.length == 0 ? usersTemp : usersfilter;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 18.0),
                cursorColor: Colors.brown,
                controller: _queryController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Buscar usuario",
                  hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                onChanged: (value) {
                  this.setState(() {});
                  usersfilter = [];
                  if (value.isNotEmpty) {
                    usersfilter = List<UserModel>.from(
                      widget.users.where(
                        (element) => element.name.toLowerCase().contains(
                              value.toLowerCase(),
                            ),
                      ),
                    );
                  } else {
                    usersfilter = usersTemp;
                  }
                }),
          ),
          usersfilter != null && usersfilter.length > 0
              ? _list(usersfilter)
              : Center(
                  child: Text(
                    'List is empty',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
        ],
      ),
    );
  }

  Widget _list(List<UserModel> usersfilter) {
    return Expanded(
      child: ListView.builder(
        key: UniqueKey(),
        itemCount: usersfilter.length,
        itemBuilder: (BuildContext context, int index) {
          final item = usersfilter[index];
          return ItemCardUser(item: item);
        },
      ),
    );
  }
}
