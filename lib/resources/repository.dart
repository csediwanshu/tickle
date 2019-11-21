import 'package:firebase_auth/firebase_auth.dart';
import 'package:tickle/resources/firebase_provider.dart';


class Repository {

  Future<FirebaseUser> getCurrentUser() => firebaseProvider.getCurrentUser();

  Future<FirebaseUser> signIn() => firebaseProvider.signIn();

  Future<bool> authenticateUser(FirebaseUser user) => firebaseProvider.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) => firebaseProvider.addDataToDb(user);

  Future<void> signOut() => firebaseProvider.signOut();

  Future<void> registerUser(String email,String password) => firebaseProvider.registerUser(email, password);

  Future<FirebaseUser> loginUser(String email,String password) => firebaseProvider.loginUser(email,password);

}

final Repository repository = new Repository();