import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Galeriden resim seçme fonksiyonu
  Future<File?> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  // Firebase Storage'a resim yükle ve Firebase Auth'daki kullanıcı profil fotoğrafını güncelle
  Future<String?> uploadImageAndUpdateAuthProfile(
      File imageFile, String userId) async {
    try {
      // Resmi Firebase Storage'a yükle
      final fileName = 'profile_picture.${imageFile.path.split('.').last}';
      final storageRef = _storage.ref().child('user_images/$userId/$fileName');
      final uploadTask = storageRef.putFile(imageFile);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print(
            'Yükleme İlerleme: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      });

      final snapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl =
          await snapshot.ref.getDownloadURL(); // Resim URL'sini al

      // Firebase Auth'taki kullanıcının profil fotoğrafını güncelle
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(downloadUrl);
        await user.reload(); // Kullanıcıyı yeniden yükleyin
      }

      return downloadUrl; // Yüklenen resmin URL'sini döndür
    } catch (e) {
      print('Resim yüklenirken hata: $e');
      return null;
    }
  }
}
