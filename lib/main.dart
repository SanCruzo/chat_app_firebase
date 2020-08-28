import 'package:chat_app_firebase/screens/auth_screen.dart';
import 'package:chat_app_firebase/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yılmazlar Chat',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        accentColor: Colors.white38,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.blueGrey,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(builder: (ctx, userSnapshot){
        if(userSnapshot.hasData){
          return ChatScreen();
        }
        return AuthScreen();
      }, stream: FirebaseAuth.instance.onAuthStateChanged,),
    );
  }
}
