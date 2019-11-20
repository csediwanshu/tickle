import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/resources/repository.dart';
import 'package:tickle/ui/login_screen.dart';

class AddFriend extends StatefulWidget{
  // final FirebaseAuth user;
  // AddFriend(this.user);
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend>{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Text('TICKLE'),
          ),
        ),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,15.0,15.0,0.0),
            child:  Container(
              child: Text('',style: TextStyle(fontSize: 20.0),),
           ), 
          )  
        ],
      ),
     body: Center(
      child: Text('hi i amhere'),
    ), 
    persistentFooterButtons: <Widget>[
      GestureDetector(
        child: Container(
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
            color: Color(0xFF4285F4),
            border: Border.all(color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
             child: Text('Sign Out',style: TextStyle(color: Colors.white, fontSize: 20.0)),
            )
          ],
        ),
      ),
      onTap: () {
        print("in sign out");
        repository.signOut().then((value) {
          Navigator.pushReplacement(context, 
          MaterialPageRoute(
            builder: (context) {return LoginScreen();}
            ),);
        },);
      },
    ),
  ],
     
    );
  }
}