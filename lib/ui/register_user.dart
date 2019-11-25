import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/buttons/custom_button.dart';
import 'package:tickle/resources/repository.dart';
import 'package:tickle/ui/login.dart';

class RegisterUser extends StatefulWidget{

  _RegisterUserState createState() => _RegisterUserState();
}
class _RegisterUserState extends State<RegisterUser>{
  String _email;
  String _password;
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('TICKLE Chat'),
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
            text: 'Register',
            callback: () async {
              await repository.registerUser(_email, _password).then((value){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Login();
                } ));
              });
            },
          ),

          
        ],
      ),
    );
  }
}