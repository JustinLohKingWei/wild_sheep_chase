import 'package:firebase_auth/firebase_auth.dart';
import 'package:wild_sheep_chase/models/user.dart';
import 'package:wild_sheep_chase/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a user
  LocalUser _userFromFirebaseUser(User u) {
    return u != null ? LocalUser(uid: u.uid) : null;
  }

  //method to set up user stream
  Stream<LocalUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth
          .signInAnonymously(); //RENAMED AuthResult TO UserCredential
      User user = result.user; //RENAMED FireBaseUser TO User
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User u = result.user;
      return _userFromFirebaseUser(u);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // register email and password with firebase
  Future registerEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User u = result.user;
//Create a new document for the user with uid
      await DataBaseService(uid: u.uid).updateUserData(
          'New UserName', 'No Drink Selected', 0, 'No toppings selected');

      return _userFromFirebaseUser(u);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
