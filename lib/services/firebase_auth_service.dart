import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> register({required String email, required String password, required String name}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseAuth.currentUser?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logIn({required String email, required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      throw Exception(e.code);
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  
}