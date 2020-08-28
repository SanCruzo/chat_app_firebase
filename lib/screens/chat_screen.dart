import 'package:chat_app_firebase/chat/messages.dart';
import 'package:chat_app_firebase/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("FireBase ile Chat"),
        actions: <Widget>[
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8,),
                      Text("Çıkış Yap")
                    ],
                  ),
                ),
                value: "logout",
              ),
            ],
            onChanged: (itemIdentifier){
              if (itemIdentifier=="logout"){
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
