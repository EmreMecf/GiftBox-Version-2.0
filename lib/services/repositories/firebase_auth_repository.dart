import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/index.dart';
import '../models/index.dart';

class FirebaseAuthRepository {
  final FirebaseAuthService firebaseAuthService;

  User? get currentUser => firebaseAuthService.currentUser;

  String? get currentUserId => firebaseAuthService.currentUser?.uid;

  FirebaseAuthRepository(this.firebaseAuthService);

  Future<Result<void, Exception>> signInWithGoogle() async {
    try {
      await firebaseAuthService.signInWithGoogle();
      return const Success(null);
    } on Exception catch (s, e) {
      return Failure(e as Exception);
    }
  }

  Future<Result<void, Exception>> signOut() async {
    try {
      await firebaseAuthService.signOut();
      return const Success(null);
    } on Exception catch (s, e) {
      return Failure(e as Exception);
    }
  }

  Future<Result<void, Exception>> updateDisplayName(String newName) async {
    try {
      await firebaseAuthService.currentUser?.updateDisplayName(newName);
      return const Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
