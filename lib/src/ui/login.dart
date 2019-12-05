import 'package:flutter/material.dart';
import '../buttons/custom_button.dart';
import 'package:tickle/src/resources/repository.dart';
import 'package:tickle/src/ui/addDescNewUser.dart';
import 'package:tickle/src/ui/insta_home_screen.dart';

class Login extends StatefulWidget{
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  String  _email;
  String _password;
  
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('TICKLE LOGIN'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Image.asset('assets/logo.png'),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value){
              _email=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter Your Email',
              // labelText: 'Email',
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20.0
          ),
          TextField(
            obscureText: true,
            onChanged: (value){
              _password=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              // labelText: 'Password',
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomButton(
            text: 'LOGIN',
            callback: () async {
              await repository.loginUser(_email, _password).then((user) async{
                await repository.authenticateUser(user).then((value){
                  if(!value){
                     print('User Details added already');
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return InstaHomeScreen(user:user);
                }));
                }
                else{
                  print('user need to be added');
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return AddDescNewUser(user:user);
                }));
                }
                });
              });
            },
          ),

          
        ],
      ),
    );
  }
  
}