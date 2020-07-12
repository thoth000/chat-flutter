import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Authenticator {
  Authenticator() {
    _firebaseAuth.onAuthStateChanged.pipe(_firebaseUser);
  }

  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseUser = BehaviorSubject<FirebaseUser>();

  Future<FirebaseUser> fetchFirebaseUser() => _firebaseAuth.currentUser();

  ValueStream<FirebaseUser> get firebaseUser => _firebaseUser;

  Future<FirebaseUser> signUp(String email, String password) async {
    final current = await _firebaseAuth.currentUser();
    if (current != null) {
      return current;
    }

    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult?.user;
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    final current = await _firebaseAuth.currentUser();
    if (current != null) {
      return current;
    }

    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult?.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  void dispose() {
    _firebaseUser.close();
  }
}
