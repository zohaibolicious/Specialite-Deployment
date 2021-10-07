import 'package:firebase_auth/firebase_auth.dart';
//import 'package:specialite/models/user.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _createUser(User user) {
    //return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    //return _auth..onAuthStateChanged.map(_createUser);
    //.map((FirebaseUser user) => _createUser(user));
    //both maps do same stuff
  }

//sign in with email & pass

  Future signInEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // AuthResult result = await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password);
      // FirebaseUser user = result.user;

      // await DBS().updateUserData(user.uid, name, email);
      //return _createUser(user);
    } catch (e) {
      return e;
    }
  }

//sign up with email ans pass
  Future signUpEmail(String email, String password, String name) async {
    String error = '';
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;

      // await DBS().updateUserData(user.uid, name, email);
      // return _createUser(user);
    } catch (e) {
      return e;
    }
  }

//sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Sign Out Error: " + e.toString());
    }
  }
}
