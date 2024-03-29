import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';
import 'dart:async';
import '../models/user.dart';

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
    // print("after current user===================== ${currentUser.email}");
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
    print("Inside authenticateUser============ ${user.email}");
    final QuerySnapshot result = await _firestore.collection("users")
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;
    print('In authenticateUser =============== ${docs.length}');
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
        phone: '',
        friends: [],);

    //  Map<String, String> mapdata = Map<String, dynamic>();

    //  mapdata = user.toMap(user);

    return _firestore.collection("users").document(currentUser.uid).setData(user.toMap(user));
  }

  Future<void> signOut() async {
    print("in firebase_provider sign out");
    bool signIn = await _googleSignIn.isSignedIn();
    if(signIn){
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    }
    return await _auth.signOut();
  }

  Future<void> registerUser(String email1,String password1) async{
    print('In register USer');
    // final FirebaseUser user = 
   FirebaseUser user= await _auth.createUserWithEmailAndPassword(
      email: email1,
      password: password1,
    );
    print('register user Suceesful $user');
    // return user;
  }

  Future<FirebaseUser> loginUser(String email,String password) async{
    print('In Login User');
    final FirebaseUser user= await _auth.signInWithEmailAndPassword(email: email,password: password);

    print('Login User ended  ${user.email}');
    return user;
  }

  Future<FirebaseUser> createFriend(String email) async {
     print("Inside createFriend Friend Email ====== $email");
    final QuerySnapshot result = await _firestore.collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();

        final List<DocumentSnapshot> docs = result.documents;
        User user3;
        print('Docs length in createFriend ====== ${docs.length}');
        for(int i=0;i<docs.length;i++){
          // print('${docs[0].data['uid']}\n${docs[0].data['email']}\n${docs[0].data['displayName']}\n${docs[0].data['photoUrl']}\n');
          user3 = User(
        uid: docs[i].data['uid'],
        email: docs[i].data['email'],
        displayName: docs[i].data['displayName'],
        photoUrl: docs[i].data['photoUrl'],
        followers: '0',
        following: '0',
        bio: '',
        posts: '0',
        phone: '',
        friends: [],);
        }

    if (docs.length == 0) {
      return null;
    } else {
       FirebaseUser currentUser1;
       currentUser1 = await _auth.currentUser();

        // final QuerySnapshot result1 = await _firestore.collection("users")
        //     .where("email", isEqualTo: currentUser1.email)
        //     .getDocuments();
        // final List<DocumentSnapshot> docs1 = result1.documents;
        // List<User> user2=[];
        // for(int i=0;i<docs1.length;i++){
        //   print('111111111111');
        //   user2 = docs1[i].data['friends'];
        //   print('22222222222');
        //   print('${docs1[i].data['friends']}');
        // }
        // user2.add(user3);
        // print('size of friends of current user in Create friend &{user2.length}');
        print('hawa===========================hawa');
        await _firestore.collection("friendsfrom${currentUser1.email}").document(docs[0].data['email']).setData(user3.toMap(user3));
        return currentUser1;
    }

  
  }

   Future<FirebaseUser> fillUserDetails(String email,String phoneNo,String name) async {
     FirebaseUser currentUser1;
     currentUser1 = await _auth.currentUser();

      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = name;
      await currentUser1.updateProfile(updateInfo);

     _firestore
        .collection("display_names")
        .document(name)
        .setData({'displayName': name,});


     user = User(
        uid: currentUser1.uid,
        email: email,
        displayName: name,
        photoUrl: '',
        followers: '0',
        following: '0',
        bio: '',
        posts: '0',
        phone: phoneNo,
        friends: [],);
        await _firestore.collection("users").document(currentUser1.uid).setData(user.toMap(user));
        currentUser1 = await _auth.currentUser();
        print('${currentUser1.displayName}');

        return currentUser1;
   }

   Future<bool> checkUserExist(String email) async{
     print('In CheckUserExist $email');
     final QuerySnapshot result = await _firestore.collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
      final List<DocumentSnapshot> docs = result.documents;
      print('CheckUserExist exist with ${docs.length}');
      if(docs.length!=0){
        return true;
      }
      else{
        return false;
      }
   }

  Future<List<DocumentSnapshot>> getFirends() async {
    print('In getFriends===================');
    FirebaseUser currentUser1;
     currentUser1 = await _auth.currentUser();
     print('In getFriends User ==================== ${currentUser1.email}');
      QuerySnapshot result =  await _firestore.collection("friendsfrom${currentUser1.email}").getDocuments();
      print('In end getFriends =======================${result.documents.length}');
     return result.documents;
   }

   Future<void> addMessages(String receiverEmail,Message message) async{
      //  Future<void> addMessageToDb(Message message, String receiverUid) async {
    print("Message : ${message.message}");
    var map = message.toMap();
    
    print("Map : $map");
    await _firestore
        .collection("messages")
        .document(message.senderEmail)
        .collection(receiverEmail)
        .add(map);

    return await _firestore
        .collection("messages")
        .document(receiverEmail)
        .collection(message.senderEmail)
        .add(map);
        
        








  }
     

  //  Stream<QuerySnapshot> getMessages(String email) async{

           
  //    FirebaseUser currentUser1;
  //    currentUser1 = await _auth.currentUser();
  //    Stream<QuerySnapshot> results = _firestore.collection('messages').document(currentUser1.email).collection(currentUser1.email).orderBy('timestamp', descending: false).snapshots();

    
  //   return results;
  //  }
}
  final FirebaseProvider firebaseProvider = new  FirebaseProvider();
