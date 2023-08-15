import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/saved_screen/saved_screen_provider.dart';

import '../../product/constants/string_constants.dart';
import '../../product/enums/png_enums.dart';
import '../../product/models/character_model.dart';
import '../../product/models/episode_model.dart';
import '../../product/models/location_model.dart';
import '../../product/services/episodes/episodes.dart';
import '../../product/services/location/location.dart';
import '../../product/theme/theme_provider.dart';

class SavedScreen extends ConsumerStatefulWidget {
  const SavedScreen({super.key});

  @override
  ConsumerState createState() => _SavedScreenState();
}

class _SavedScreenState extends ConsumerState<SavedScreen> {
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
          // actions: [
          //   ref.watch(themeProvider).isDarkTheme
          //       ? IconButton(
          //     icon: const Icon(Icons.nights_stay_outlined),
          //     onPressed: () {
          //       _showModalBottomSheet(context);
          //     },
          //   )
          //       : IconButton(
          //     icon: const Icon(
          //       Icons.wb_sunny_outlined,
          //       color: ColorConstants.yellowColor,
          //     ),
          //     onPressed: () {
          //       _showModalBottomSheet(context);
          //     },
          //   ),
          // ],
          bottom:  const TabBar(
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
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context,index){
                return ListTile(
                  title: Text(ref.watch(savedScreenProvider).savedCharacterList[index].name),
                  subtitle: Text(ref.watch(savedScreenProvider).savedCharacterList[index].status),
                );
              },itemCount: ref.watch(savedScreenProvider).savedCharacterList.length,)

            ),
            FutureBuilder<List<LocationModel>>(
              future: LocationService().getAllLocations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Center(child: Text('Error Loading Data.'));
                } else {
                  var locations = snapshot.data!;
                  return ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locations[index].name),
                        subtitle: Text('Index Number - ${index + 1}'),
                      );
                    },
                  );
                }
              },
            ),
            FutureBuilder<List<Episode>>(
              future: EpisodeService().getAllEpisodes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Center(child: Text('Error Loading Data.'));
                } else {
                  var episodes = snapshot.data!;
                  return ListView.builder(
                    itemCount: episodes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(episodes[index].name),
                        subtitle: Text('Index Number - ${index + 1}'),
                      );
                    },
                  );
                }
              },
            )
          ],
        ),

        // FutureBuilder<List<Character>>(
        //   future: CharacterService().getAllCharacters(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: Lottie.asset(LottieItems.loading.lottiePath,width: MediaQuery.sizeOf(context).width * 0.5,height: MediaQuery.sizeOf(context).height * 0.3,));
        //     } else if (snapshot.hasError || snapshot.data == null) {
        //       return const Center(child: Text('Error Loading Data.'));
        //     } else {
        //       var characters = snapshot.data!;
        //       return ListView.builder(
        //         itemCount: characters.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: Text(characters[index].name),
        //             subtitle: Text('Index Number - ${index + 1}'),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
