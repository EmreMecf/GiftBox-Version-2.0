import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/models/index.dart';
import '../services/repositories/firebasee_storage_repository.dart';
import 'index.dart';

class UpdateProfileImageViewModel with ChangeNotifier {
  final FirebaseStorageRepository _storageRepository;
  final ErrorViewModel _errorViewModel;

  File? _selectedImage;
  bool _isLoading = false;
  bool _isImageUploaded = false;

  File? get selectedImage => _selectedImage;

  bool get isLoading => _isLoading;

  bool get isImageUploaded => _isImageUploaded;

  UpdateProfileImageViewModel(this._storageRepository, this._errorViewModel);

  // Resmi sıkıştırmak için fonksiyon
  Future<File?> compressImage(File file) async {
    final dir = await getTemporaryDirectory();

    final targetPath =
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_compressed.jpg';

    // Resmi sıkıştırma işlemi
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70,
      minWidth: 800,
      minHeight: 800,
    );

    if (result != null) {
      return File(result.path);
    }

    return null;
  }

  // İzinleri kontrol etme ve galeriden resim seçme işlemi
  Future<void> selectImageWithPermission() async {
    _isLoading = true;
    notifyListeners();

    PermissionStatus permission = await Permission.photos.request();
    if (permission.isGranted) {
      final result = await _storageRepository.pickImageFromGallery();
      if (result is Success<File, Exception>) {
        _selectedImage = result.value;
      } else if (result is Failure<File, Exception>) {
        _errorViewModel.setError(result.exception.toString());
      }
    } else {
      _errorViewModel.setError('Galeri izni verilmedi.');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Firebase'e resim yükleme ve URL'yi güncelleme işlemi
  Future<void> uploadImageAndUpdateProfile(String userId) async {
    if (_selectedImage == null) {
      _errorViewModel.setError('Lütfen önce bir resim seçin.');
      return;
    }

    _isLoading = true;
    _isImageUploaded = false;
    notifyListeners();

    // Sıkıştırma işlemi
    File? compressedImage = (await compressImage(_selectedImage!)) as File?;

    if (compressedImage != null) {
      // Sıkıştırılmış resmi Firebase'e yükle
      final result = await _storageRepository.uploadImageAndUpdateAuthProfile(
          compressedImage, userId);

      if (result is Success<void, Exception>) {
        _isImageUploaded = true;
      } else if (result is Failure<void, Exception>) {
        _errorViewModel.setError(result.exception.toString());
      }
    } else {
      _errorViewModel.setError('Resim sıkıştırılamadı.');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Durumu ve resmi sıfırla
  void resetImage() {
    _selectedImage = null;
    _isImageUploaded = false;
    notifyListeners();
  }
}
