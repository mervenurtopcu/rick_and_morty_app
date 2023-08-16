import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/product/services/episodes/episode_service.dart';

void main() {
  EpisodeService episodeService = EpisodeService();

  setUp(() {});

  test('Get all episodes', () async {
    var episodes = await episodeService.getAllEpisodes();
    expect(episodes.isNotEmpty, true);
  });
}
