import 'package:chat_app/chat/messages.dart';
import 'package:chat_app/chat/new_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryTextTheme.button.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout'),
                  ]),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
          Expanded(child: Messages()),
            NewMessage(),
          ]
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Firestore.instance
      //         .collection('chats/pEqs5FG3Iup37ZFXg8cm/messages')
      //         .add({'text': 'This was by added by clicking button'});
      //   },
      // ),
    );
  }
}
