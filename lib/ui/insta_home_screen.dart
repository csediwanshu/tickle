import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/resources/repository.dart';
import 'package:tickle/ui/addFriend.dart';
import 'package:tickle/ui/chat.dart';
import 'package:tickle/ui/login_screen.dart';
import '../resources/repository.dart';


class InstaHomeScreen extends StatefulWidget {
  final FirebaseUser user ;
  InstaHomeScreen({Key key,this.user}) : super(key: key);
  _InstaHomeScreenState createState() => _InstaHomeScreenState();
}

// PageController pageController;

class _InstaHomeScreenState extends State<InstaHomeScreen> {

  TextEditingController messageController = TextEditingController();

  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: (){
          //     Navigator.pop(context);
          //   },
          // ),
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

      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: FutureBuilder(
                    future: repository.getFriends(),
                    builder: (BuildContext context,AsyncSnapshot<List<DocumentSnapshot>> snapshot){ 
                    if(!snapshot.hasData){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else{
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context,index){
                            return ListTile(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(
                                  builder: (context){
                                    print(snapshot.data[index].data['email']);
                                    return Chat(email : snapshot.data[index].data['email'],user: widget.user);
                                  }
                                ));
                              },
                              title: Text(snapshot.data[index].data['displayName']),
                            );
                          },
                        );
                      }
                    },
                  ),
            ),
          ),
          Container(
            height: 0.0,
            width: 0.0,
          ),
        ],
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
      
      ),
    ); 
  }
}

