import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import '../../models/episode_model.dart';
import '../get_data_service.dart';

class EpisodeService extends IGetDataService {
  Future<List<Episode>> getAllEpisodes() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${AppConstants.baseURL}${AppConstants.episodeEndpoint}');

    return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  }

  Future<List<Episode>> getListOfEpisodes(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${AppConstants.baseURL}${AppConstants.episodeEndpoint}/$ids');

    return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  }

  // Future<List<Episode>> getFilteredEpisodes(EpisodeFilters filters) async {
  //   var prefs = '?name=${filters.name}&episode=${filters.episode}';
  //
  //   List<Map<String, dynamic>> objects = await super.getAllEntities(
  //       '${Constants.baseURL}${Constants.episodeEndpoint}$prefs');
  //
  //   return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  // }
}