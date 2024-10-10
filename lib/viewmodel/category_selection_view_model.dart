import 'package:flutter/material.dart';

import '../services/models/states/category_selection_model.dart';

class CategorySelectionViewModel with ChangeNotifier {
  double _age = 25;
  String _minBudget = '';
  String _maxBudget = '';
  String _gender = 'Erkek';
  String _specialDay = 'Doğum Günü';
  List<String> _selectedInterests = [];
  String _selectedCategory = 'Eğlence';

  // Getters
  double get age => _age;

  String get minBudget => _minBudget;

  String get maxBudget => _maxBudget;

  String get gender => _gender;

  String get specialDay => _specialDay;

  List<String> get selectedInterests => _selectedInterests;

  String get selectedCategory => _selectedCategory;

  // Setters
  set age(double value) {
    _age = value;
    notifyListeners();
  }

  set minBudget(String value) {
    _minBudget = value;
    notifyListeners();
  }

  set maxBudget(String value) {
    _maxBudget = value;
    notifyListeners();
  }

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  set specialDay(String value) {
    _specialDay = value;
    notifyListeners();
  }

  void toggleInterest(String interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
    } else {
      _selectedInterests.add(interest);
    }
    notifyListeners();
  }

  set selectedCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }

  // Seçimleri sıfırlayan metot
  void resetSelection() {
    _age = 25;
    _minBudget = '';
    _maxBudget = '';
    _gender = 'Erkek';
    _specialDay = 'Doğum Günü';
    _selectedInterests = [];
    _selectedCategory = 'Eğlence';
    notifyListeners(); // UI'ı güncelle
  }

  CategorySelectionModel buildCategorySelectionModel() {
    return CategorySelectionModel(
      minBudget: minBudget,
      maxBudget: maxBudget,
      age: age.toString(),
      gender: gender,
      specialDay: specialDay,
      interests: selectedInterests,
    );
  }
}
