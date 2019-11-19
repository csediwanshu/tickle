import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFriend extends StatefulWidget{
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder(
        builder: list,
      ),
      
    );
  }
}