import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/models/character_model.dart';
import '../../product/services/character/character_service.dart';

class HomeScreenProvider extends ChangeNotifier {
  final CharacterService _characterService = CharacterService();
  Character? _character;
  Character? get getCharacter => _character;

  void getRandomCharacter() {
    _characterService.getCharacterById(Random().nextInt(826)).then((value) {
      _character = value;
      notifyListeners();
    });
  }
}

final homeScreenProvider =
    ChangeNotifierProvider((ref) => HomeScreenProvider());
