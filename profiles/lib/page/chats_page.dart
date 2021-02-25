import 'package:flutter/material.dart';
import 'package:profiles/api/firebase_api.dart';
import 'package:profiles/model/user.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue,
    body: SafeArea(
      child: StreamBuilder<List<User>>(
        stream: FirebaseApi.getUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return buildText('Something Went Wrong Try Later');
              }
              else {
                final users = snapshot.data;
                return Column(
                  children: [
                    //ChatHeaderWidget(users:users),
                    //ChatBodyWidget(users: users),
                  ],
                );
              }
          }
        },
      ),
    ),
  );

  Widget buildText(String text) => Center (
    child: Text (
      text,
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}