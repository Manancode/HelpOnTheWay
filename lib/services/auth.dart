import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpontheway/models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  TheUser _userFromFirebaseUser(User user) {
    if (user!=null){
      return TheUser(uid: user.uid) ; 
    } else{
      throw Exception('user is null') ;
    }
  
  }

  //auth change user stream
  Stream<TheUser> get user {
    // ignore: deprecated_member_use
    return _auth.authStateChanges().map((User?user) => _userFromFirebaseUser(user!));
  }

  //Anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User?user = result.user;
      return _userFromFirebaseUser(user!);
      //return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign iin Email and password
  Future signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      User?user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      User?user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Error Occured: ' + e.toString());
      return null;
    }
  }
}