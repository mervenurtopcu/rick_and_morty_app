import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty_app/features/character_detail/character_detail_screen.dart';
import 'package:rick_and_morty_app/features/search/search_delegate.dart';
import 'package:rick_and_morty_app/product/extensions/lottie_extensions.dart';
import 'package:rick_and_morty_app/product/services/character/character_service.dart';
import 'package:rick_and_morty_app/product/services/episodes/episode_service.dart';
import 'package:rick_and_morty_app/product/services/location/location_service.dart';
import '../../product/constants/index.dart';
import '../../product/enums/index.dart';
import '../../product/models/index.dart';
import '../../product/theme/index.dart';
import '../../product/widgets/index.dart';
import 'home_screen_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final futureCharacters = CharacterService().getAllCharacters();
  final futureLocations = LocationService().getAllLocations();
  final futureEpisodes = EpisodeService().getAllEpisodes();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            PngEnums.header.toPng,
            height: MediaQuery.sizeOf(context).width * 0.1,
            width: MediaQuery.sizeOf(context).width * 0.6,
            fit: BoxFit.fill,
          ),
          centerTitle: true,
          actions: [
            ref.watch(themeProvider).isDarkTheme
                ? IconButton(
                    icon: const Icon(Icons.nights_stay_outlined),
                    onPressed: () {
                      _showModalBottomSheet(context);
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.wb_sunny_outlined,
                      color: ColorConstants.yellowColor,
                    ),
                    onPressed: () {
                      _showModalBottomSheet(context);
                    },
                  ),
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CharacterSearch());
                },
                icon: Icon(
                  Icons.search,
                  color: ref.watch(themeProvider).isDarkTheme
                      ? ColorConstants.white
                      : ColorConstants.black,
                ))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: StringConstants.characters,
              ),
              Tab(
                text: StringConstants.locations,
              ),
              Tab(
                text: StringConstants.episodes,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showLottieAndNavigate(context);
          },
          child: const Icon(Icons.shuffle),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Character>>(
                future: futureCharacters,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Lottie.asset(
                      LottieItems.loading.lottiePath,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                    ));
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                        child: Text(StringConstants.errorMessage));
                  } else {
                    var characters = snapshot.data!;
                    return ListView.builder(
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        final character = characters[index];
                        return CharacterContainer(
                            character: character,
                            ref: ref,
                            characters: characters);
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<LocationModel>>(
                future: futureLocations,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Lottie.asset(
                          LottieItems.loading.lottiePath,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: MediaQuery.sizeOf(context).height * 0.3,
                        ));
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                        child: Text(StringConstants.errorMessage));
                  } else {
                    var locations = snapshot.data!;
                    return ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final location = locations[index];
                        return LocationCard(location: location, ref: ref);
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Episode>>(
                future: futureEpisodes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Lottie.asset(
                          LottieItems.loading.lottiePath,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: MediaQuery.sizeOf(context).height * 0.3,
                        ));
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                        child: Text(StringConstants.errorMessage));
                  } else {
                    var episodes = snapshot.data!;
                    return ListView.builder(
                      itemCount: episodes.length,
                      itemBuilder: (context, index) {
                        final episode = episodes[index];
                        return EpisodeCard(episode: episode, ref: ref);
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      color: ColorConstants.grey,
                      thickness: 4,
                      indent: MediaQuery.of(context).size.width * 0.45,
                      endIndent: MediaQuery.of(context).size.width * 0.45,
                    ),
                    Text(
                      StringConstants.darkMode,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.darkMode,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.normal)),
                          Switch(
                            value: ref.watch(themeProvider).isDarkTheme,
                            onChanged: (value) {
                              if (value) {
                                ref.read(themeProvider).setDarkTheme();
                              } else {
                                ref.read(themeProvider).setLightTheme();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  void _showLottieAndNavigate(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: ColorConstants.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(LottieItems.spin.lottiePath),
            ],
          ),
        );
      },
    );
    ref.read(homeScreenProvider).getRandomCharacter();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailScreen(
                  character: ref.watch(homeScreenProvider).getCharacter),fullscreenDialog: true
            ));
      },
    );
  }
}
