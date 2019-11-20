import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/resources/repository.dart';
import 'package:tickle/ui/addFriend.dart';
import 'package:tickle/ui/login_screen.dart';
import '../resources/repository.dart';


class InstaHomeScreen extends StatefulWidget {
  final FirebaseUser user ;
  InstaHomeScreen(this.user);
  _InstaHomeScreenState createState() => _InstaHomeScreenState();
}

// PageController pageController;

class _InstaHomeScreenState extends State<InstaHomeScreen> {

  Widget build(BuildContext context) {
    // Set<FirebaseUser> _user= {widget.user} ;
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
            padding: const EdgeInsets.fromLTRB(0.0,15.0,10.0,0.0),
            child: Container(
              child: IconButton(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0.0,0.0,15.0,20.0),
                icon: Icon(Icons.add),
                onPressed: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(
                    builder: (context) {return AddFriend();}
                    ),
                  );
                },
                color: Colors.white,
                iconSize: 30.0,
              ),  
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,15.0,15.0,0.0),
            child:  Container(
              child: Text('${widget.user.displayName}',style: TextStyle(fontSize: 20.0),),
           ), 
          )  
        ],
      ),
     body: Center(
      child: Text('hi i am here'),
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

 Widget  addFriendToList() {
   
  }
}

