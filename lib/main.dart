import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/resources/repository.dart';
import 'package:tickle/ui/addDescNewUser.dart';
import 'package:tickle/ui/insta_home_screen.dart';
import 'package:tickle/ui/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagram',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
            textTheme: TextTheme(title: TextStyle(color: Colors.black))),
        home: Scaffold(
          body: FutureBuilder(
              future: repository.getCurrentUser(),
              builder: (BuildContext context,  AsyncSnapshot<FirebaseUser> snapshot){
                if(snapshot.hasData) {
                  repository.authenticateUser(snapshot.data).then((value){
                    if(value){
                      return Navigator.pushReplacement(context,MaterialPageRoute(
                        builder: (context){return AddDescNewUser(user: snapshot.data,);}
                        )
                      ); 
                    }
                    else {
                      return  Navigator.pushReplacement(context,MaterialPageRoute(
                        builder: (context){
                          return InstaHomeScreen(user:snapshot.data); 
                          })); 
                    }});
              } else {
                return LoginScreen();
            }
            return Container(height: 11.0,width: .0,);
            },
          ),
        ), 
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(
      //     builder: (context){
      //       return 
      //     },
      //   );
      // },
    );
  }
}
