import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget{
  final FirebaseUser user;

  const Chat({Key key,this.user}):super(key: key);

  _ChatState createState() => _ChatState();
}
class _ChatState extends State<Chat>{
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('TICKLE Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                // s) ,
              ),
            )
          ],
        )
      ),
    );
  }
}