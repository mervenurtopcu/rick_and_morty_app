import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import '../../models/episode_model.dart';
import '../get_data_service.dart';

class EpisodeService extends IGetDataService {
  Future<List<Episode>> getAllEpisodes() async {
    List<Map<String, dynamic>> objects = await super
        .getAllDatas('${AppConstants.baseURL}${AppConstants.episodeEndpoint}');

    return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  }
}
