import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  // Sign up with email and password
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      String userId = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('Usuarios').doc(userId).set({
        'name': 'name',
        'last_name': email,
        'age': '24',
      });
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}