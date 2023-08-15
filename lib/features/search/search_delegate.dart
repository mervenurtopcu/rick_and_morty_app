import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/product/constants/index.dart';
import 'package:rick_and_morty_app/product/models/index.dart';
import 'package:rick_and_morty_app/product/services/character/character_service.dart';
import '../character_detail/character_detail_screen.dart';

class CharacterSearch extends SearchDelegate<String> {
  final futureCharacterService = CharacterService();
  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, '');
        } else {
          query = '';
          showSuggestions(context);
        }
      },
    )
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, ''),
  );

  @override
  Widget buildResults(BuildContext context) =>
      FutureBuilder<List<Character>>(
    future: futureCharacterService.getCharacterByName(query),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator());
        default:
          if (snapshot.hasError) {
            return Container(
              color: Colors.black,
              alignment: Alignment.center,
              child:  Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(
                  color: ColorConstants.white,
                  fontSize: 18,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final character = snapshot.data![index];
                return ListTile(
                  onTap: () => buildResultSuccess(context,character),
                  leading: Image.network(
                    character.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    character.name,
                    style: const TextStyle(
                      color: ColorConstants.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            );
          }
      }
    },
  );

  @override
  Widget buildSuggestions(BuildContext context) => Container(
    color: Colors.transparent,
    child: FutureBuilder<List<Character>>(
      future:  futureCharacterService.getCharacterByName(query),
      builder: (context, snapshot) {
        if (query.isEmpty) return buildNoSuggestions();

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.white,
                  strokeWidth: 2,
                ));
          default:
            if (snapshot.hasError || snapshot.data == null) {
              return buildNoSuggestions();
            } else {
              return buildSuggestionsSuccess(snapshot.data!);
            }
        }
      },
    ),
  );

  Widget buildNoSuggestions() => const SingleChildScrollView(
    child: Center(
      child: Text(
        StringConstants.noSuggestions,
        style:
        TextStyle(fontSize: 18, color: ColorConstants.grey),
      ),
    ),
  );

  Widget buildSuggestionsSuccess(List<Character> suggestions) => ListView.builder(
    itemCount: suggestions.length,
    itemBuilder: (context, index) {
      final suggestion = suggestions[index];
      final queryText = suggestion.name.substring(0, query.length);
      final remainingText = suggestion.name.substring(query.length);

      return ListTile(
        onTap: () {
          query = suggestion.name;
          showResults(context);
        },
        leading: Image.network(
          suggestion.image,
          width: 50,
          height: 50,
        ),
        title: RichText(
          text: TextSpan(
            text: queryText,
            style: const TextStyle(
              color: ColorConstants.loginSubtitle,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: remainingText,
                style: const TextStyle(
                  color: ColorConstants.red,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  Future buildResultSuccess(BuildContext context,Character character) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CharacterDetailScreen(
        character: character,
      ),
    ),
  );

}