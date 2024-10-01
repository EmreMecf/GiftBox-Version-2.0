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
      // Kullanıcıyı Firebase'den yeniden yükle
      await firebaseAuthService.currentUser?.reload();
      return const Success(null);
    } on Exception catch (e) {
      return Failure(e);
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

  Future<Result<void, Exception>> updateProfileImage(String imageUrl) async {
    try {
      // Kullanıcının profiline yeni profil fotoğrafı ekle
      await firebaseAuthService.currentUser?.updatePhotoURL(imageUrl);
      await firebaseAuthService.currentUser
          ?.reload(); // Firebase'deki bilgileri yeniden yükle
      return const Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
