import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/character_detail/character_detail_screen.dart';
import '../constants/color_constants.dart';
import '../constants/string_constants.dart';
import '../models/character_model.dart';
import '../theme/theme_provider.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer({
    super.key,
    required this.character,
    required this.ref,
    required this.characters,
  });

  final Character character;
  final WidgetRef ref;
  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorConstants.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: character.status == StringConstants.statusAlive
                    ? ColorConstants.green
                    : ColorConstants.red,
                width: 2),
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: character.status == StringConstants.statusAlive
                              ? ColorConstants.green
                              : ColorConstants.red,
                          width: 2),
                    ),
                    child: Image.network(
                      character.image,
                      fit: BoxFit.fill,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              character.name,
                              style: Theme.of(context).textTheme.titleSmall,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              character.species,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: ColorConstants.loginSubtitle),
                            )),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    StringConstants.location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: ref
                                                    .watch(themeProvider)
                                                    .isDarkTheme
                                                ? ColorConstants.white
                                                : ColorConstants.black),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    character.location.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color:
                                                ColorConstants.loginSubtitle),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CharacterDetailScreen(character: character),
                                fullscreenDialog: true));
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: ColorConstants.grey, size: 16))
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ref.watch(themeProvider).isDarkTheme
                  ? ColorConstants.black
                  : ColorConstants.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
              border: Border.all(
                  color: character.status == StringConstants.statusAlive
                      ? ColorConstants.green
                      : ColorConstants.red,
                  width: 2),
            ),
            child: Text(
              character.status,
              style: TextStyle(
                  color: character.status == StringConstants.statusAlive
                      ? ColorConstants.green
                      : ColorConstants.red),
            ),
          ),
        ),
      ],
    );
  }
}
