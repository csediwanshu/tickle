import 'package:flutter/material.dart';
import 'package:tickle/src/resources/repository.dart';
import 'package:tickle/src/ui/insta_home_screen.dart';
import 'package:tickle/src/ui/login_screen.dart';


class AddFriend extends StatefulWidget{
  // final String userEmail;
  // AddFriend({Key key,this.userEmail}) :super(key :key);
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend>{
  //  String _phoneNo;
  //  String _name;
   String _email;

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
      child: Container(
        child: Column(
          children: <Widget>[
             Container(
               child: Padding(
                 padding: EdgeInsets.all(20.0),
                 child: TextField(
                  onChanged: (value){
                    _email = value;
                  },
                  decoration: InputDecoration(
                  hintText: 'Enter Email',
                  border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            // Container(
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 13.0),
            //     child: TextField(
            //       onChanged: (value){
            //         _name = value;
            //       },
            //       decoration: InputDecoration(
            //       hintText: 'Enter Name',
            //       border: const OutlineInputBorder(),
            //       ),
            //     ),
            //   ),
            // ),
            RaisedButton(
              splashColor: Colors.orangeAccent,
              onPressed: (){
                repository.createFriend(_email).then((value){
                  if(value != null ){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context){
                        return InstaHomeScreen(user: value);
                      }
                    ));
                  }
                  else {
                    print('error');
                    Text('Please Enter the correct email');
                    Duration(seconds: 1);
                  }
                });
              },
              textColor: Colors.orange,
              child: Text('Submit'),
            ),

          ],
        ),
      )
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

