import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // register user
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  })async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }


  
}