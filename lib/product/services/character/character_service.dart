import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import '../../models/character_model.dart';
import '../get_data_service.dart';

class CharacterService extends IGetDataService {
  Future<List<Character>> getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getListOfCharacters(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}/$ids');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getCharactersByName(String name) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}?name=$name');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<Character> getCharacterByName(String name) async {
    List<Map<String, dynamic>> objects = await super.getAllDatas(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}?name=$name');
    return Character.fromJson(objects.first);
  }

}
