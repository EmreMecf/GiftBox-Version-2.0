import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InterestsViewModel extends ChangeNotifier {
  String _selectedCategory = '';
  List<String> _selectedInterests = [];

  // Kategori ve ilgiler
  late Map<String, List<String>> _categoryInterests;

  String get selectedCategory => _selectedCategory;

  List<String> get selectedInterests => _selectedInterests;

  InterestsViewModel(BuildContext context) {
    // Localizations'dan kategorileri ve ilgileri al
    _categoryInterests = {
      AppLocalizations.of(context)!.category_entertainment: [
        AppLocalizations.of(context)!.interest_board_game,
        AppLocalizations.of(context)!.interest_video_game,
        AppLocalizations.of(context)!.interest_card_game,
        AppLocalizations.of(context)!.interest_movies,
      ],
      AppLocalizations.of(context)!.category_music: [
        AppLocalizations.of(context)!.interest_guitar,
        AppLocalizations.of(context)!.interest_drum,
        AppLocalizations.of(context)!.interest_vinyl,
        AppLocalizations.of(context)!.interest_rap,
        AppLocalizations.of(context)!.interest_pop,
      ],
      AppLocalizations.of(context)!.category_technology: [
        AppLocalizations.of(context)!.interest_ai,
        AppLocalizations.of(context)!.interest_programming,
        AppLocalizations.of(context)!.interest_hardware,
      ],
      AppLocalizations.of(context)!.category_sports: [
        AppLocalizations.of(context)!.interest_football,
        AppLocalizations.of(context)!.interest_basketball,
        AppLocalizations.of(context)!.interest_swimming,
      ],
      AppLocalizations.of(context)!.category_fashion: [
        AppLocalizations.of(context)!.interest_clothing,
        AppLocalizations.of(context)!.interest_shoes,
        AppLocalizations.of(context)!.interest_accessories,
      ],
    };
  }

  // Seçili kategoriyi değiştir
  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // İlgiyi seç veya kaldır
  void toggleInterest(String interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
    } else {
      _selectedInterests.add(interest);
    }
    notifyListeners();
  }

  // Kategorideki ilgiler
  List<String> getInterestsForSelectedCategory() {
    return _categoryInterests[_selectedCategory] ?? [];
  }
}
