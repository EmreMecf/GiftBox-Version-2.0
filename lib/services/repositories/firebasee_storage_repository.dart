import 'dart:io';

import '../firebase/index.dart';
import '../models/index.dart';

class FirebaseStorageRepository {
  final FirebaseStorageService firebaseStorageService;

  FirebaseStorageRepository(this.firebaseStorageService);

  // Galeriden resim seçmek
  Future<Result<File, Exception>> pickImageFromGallery() async {
    try {
      final image = await firebaseStorageService.pickImageFromGallery();
      if (image != null) {
        return Success(image);
      } else {
        return Failure(Exception('Resim seçilmedi.'));
      }
    } catch (e) {
      return Failure(e as Exception);
    }
  }

  // Firebase Storage'a resim yükleyip Firebase Auth'daki profil fotoğrafını güncelle
  Future<Result<void, Exception>> uploadImageAndUpdateAuthProfile(
      File imageFile, String userId) async {
    try {
      final imageUrl = await firebaseStorageService
          .uploadImageAndUpdateAuthProfile(imageFile, userId);

      if (imageUrl != null) {
        return const Success(null); // Başarılı sonuç döndür
      } else {
        return Failure(Exception('Resim yüklenemedi.'));
      }
    } catch (e) {
      return Failure(e as Exception);
    }
  }
}
