
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:tickle/models/user.dart';


class FirebaseProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  User user;
  // Post post;
  // Like like;
  // Message _message;
  // Comment comment;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // StorageReference _storageReference;

  Future<FirebaseUser> getCurrentUser() async {
    print("in current user================================");
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    print("after current user===================== $currentUser");
    if(currentUser!=null)
    print("EMAIL ID : ${currentUser.email}");
    // _firestore.collection("display_names").document("axe").setData({'displayName': "hawa"});
    return currentUser;
  }

  Future<FirebaseUser> signIn() async {
    print('in sigIn method');
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication = await _signInAccount.authentication;
   
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: _signInAuthentication.accessToken,
      idToken: _signInAuthentication.idToken,
    );


    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print('${user.displayName}');
    return user;
  }
  
  Future<bool> authenticateUser(FirebaseUser user) async {
    print("Inside authenticateUser");
    final QuerySnapshot result = await _firestore.collection("users")
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    if (docs.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addDataToDb(FirebaseUser currentUser) async {
    print("Inside addDataToDb Method");

    _firestore
        .collection("display_names")
        .document(currentUser.displayName)
        .setData({'displayName': currentUser.displayName,});

    user = User(
        uid: currentUser.uid,
        email: currentUser.email,
        displayName: currentUser.displayName,
        photoUrl: currentUser.photoUrl,
        followers: '0',
        following: '0',
        bio: '',
        posts: '0',
        phone: '');

    //  Map<String, String> mapdata = Map<String, dynamic>();

    //  mapdata = user.toMap(user);

    return _firestore.collection("users").document(currentUser.uid).setData(user.toMap(user));
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }
  
}



  final FirebaseProvider firebaseProvider = new  FirebaseProvider();
