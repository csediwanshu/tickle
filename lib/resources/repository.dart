// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tickle/models/message.dart';
import 'package:tickle/resources/firebase_provider.dart';


class Repository {

  Future<FirebaseUser> getCurrentUser() => firebaseProvider.getCurrentUser();

  Future<FirebaseUser> signIn() => firebaseProvider.signIn();

  Future<bool> authenticateUser(FirebaseUser user) => firebaseProvider.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) => firebaseProvider.addDataToDb(user);

  Future<void> signOut() => firebaseProvider.signOut();

  Future<void> registerUser(String email,String password) => firebaseProvider.registerUser(email, password);

  Future<FirebaseUser> loginUser(String email,String password) => firebaseProvider.loginUser(email,password);

  Future<FirebaseUser> createFriend(String email) => firebaseProvider.createFriend(email);

  Future<FirebaseUser> fillUserDetails(String email,String phoneNo,String name) => firebaseProvider.fillUserDetails(email,phoneNo,name);

  Future<bool> checkUserExist(String email) => firebaseProvider.checkUserExist(email);

  Future<List<DocumentSnapshot>> getFriends() => firebaseProvider.getFirends();

  Future<void> addMessages(String recieverEmail , Message message) => firebaseProvider.addMessages(recieverEmail,message);

  // Stream<QuerySnapshot> getMessages(String receiverEmail) => firebaseProvider.getMessages(receiverEmail);
}

final Repository repository = new Repository();