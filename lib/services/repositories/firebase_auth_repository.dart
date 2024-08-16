import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/index.dart';
import '../models/index.dart';

class FirebaseAuthRepository {
  final FirebaseAuthService firebaseAuthService;

  User? get currentUser => firebaseAuthService.currentUser;

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
      final user = currentUser;
      if (user != null) {
        await user.updateDisplayName(newName);
        await user.reload();
        return const Success(null);
      } else {
        return Failure(Exception("User is not logged in"));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
