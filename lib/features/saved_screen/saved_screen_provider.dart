import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/product/models/character_model.dart';
import 'package:rick_and_morty_app/product/models/episode_model.dart';
import 'package:rick_and_morty_app/product/models/location_model.dart';
import 'package:rick_and_morty_app/product/services/shared_manager.dart';

class SavedScreenProvider extends ChangeNotifier {
  // SavedScreenProvider() {
  //   _savedCharacterList = SharedManager.getStringList(SharedKeys.characterList)!.cast<Character>();
  //   _savedLocationList = SharedManager.getStringList(SharedKeys.locationList)!.cast<LocationModel>();
  //   _savedEpisodeList = SharedManager.getStringList(SharedKeys.episodeList)!.cast<Episode>();
  //   notifyListeners();
  // }
  final  List<Character> _savedCharacterList = [];
  List<Character> get savedCharacterList => _savedCharacterList;

  final List<LocationModel> _savedLocationList = [];
  List<LocationModel> get savedLocationList => _savedLocationList;

  final List<Episode> _savedEpisodeList = [];
  List<Episode> get savedEpisodeList => _savedEpisodeList;

  void addToList(dynamic model) {
    if(model is Character) {
      _savedCharacterList.add(model);
      notifyListeners();
    //  SharedManager.setStringList(SharedKeys.characterList, _savedCharacterList.map((e) => e.id.toString()).toList());
      //SharedManager.getStringList(SharedKeys.characterList)?.add(model.id.toString());
    } else if(model is LocationModel) {
      _savedLocationList.add(model);
      notifyListeners();
     // SharedManager.setStringList(SharedKeys.locationList, _savedLocationList.map((e) => e.id.toString()).toList());
     // SharedManager.getStringList(SharedKeys.locationList)?.add(model.id.toString());
    } else if(model is Episode) {
      _savedEpisodeList.add(model);
      notifyListeners();
     // SharedManager.setStringList(SharedKeys.episodeList, _savedEpisodeList.map((e) => e.id.toString()).toList());
      //SharedManager.getStringList(SharedKeys.episodeList)?.add(model.id.toString());
    }
    notifyListeners();
  }

  void removeFromList(dynamic model) {
    if(model is Character) {
      _savedCharacterList.remove(model);
    //  SharedManager.setStringList(SharedKeys.characterList, _savedCharacterList.map((e) => e.id.toString()).toList());
      //SharedManager.getStringList(SharedKeys.characterList)?.remove(model.id.toString());
    } else if(model is LocationModel) {
      _savedLocationList.remove(model);
    //  SharedManager.setStringList(SharedKeys.locationList, _savedLocationList.map((e) => e.id.toString()).toList());
      //SharedManager.getStringList(SharedKeys.locationList)?.remove(model.id.toString());
    } else if(model is Episode) {
      _savedEpisodeList.remove(model);
     // SharedManager.setStringList(SharedKeys.episodeList, _savedEpisodeList.map((e) => e.id.toString()).toList());
      //SharedManager.getStringList(SharedKeys.episodeList)?.remove(model.id.toString());
    }
    notifyListeners();
  }

  void clearList() {
    _savedCharacterList.clear();
    _savedLocationList.clear();
    _savedEpisodeList.clear();
    SharedManager.clear();
    notifyListeners();
  }
}

final savedScreenProvider =
ChangeNotifierProvider((ref) => SavedScreenProvider());