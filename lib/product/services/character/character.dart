import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import '../../models/character_model.dart';
import '../get_data_service.dart';

class CharacterService extends IGetDataService {

  Future<List<Character>> getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${AppConstants.baseURL}${AppConstants.characterEndpoint}');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getListOfCharacters(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${AppConstants.baseURL}${AppConstants.characterEndpoint}/$ids');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }
  //
  // Future<List<Character>> getFilteredCharacters(
  //     CharacterFilters filters) async {
  //   var prefs =
  //       '?name=${filters.name}&status=${characterStatusValues[filters.status]}&gender=${characterGenderValues[filters.gender]}&type=${filters.type}&species=${characterSpeciesValues[filters.species]}';
  //
  //   List<Map<String, dynamic>> objects = await super.getAllEntities(
  //       '${Constants.baseURL}${Constants.characterEndpoint}$prefs');
  //
  //   return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  // }
}