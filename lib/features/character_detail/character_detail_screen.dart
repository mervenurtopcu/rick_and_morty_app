import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/product/widgets/app_bar_general.dart';

import '../../product/constants/color_constants.dart';
import '../../product/constants/string_constants.dart';
import '../../product/models/character_model.dart';
import '../../product/theme/theme_provider.dart';

class CharacterDetailScreen extends ConsumerStatefulWidget {
  const CharacterDetailScreen({super.key, required this.character});

  final Character character;

  @override
  ConsumerState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends ConsumerState<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarGeneral(
          ref: ref,
          title: widget.character.name,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: widget.character.status ==
                                    StringConstants.statusAlive
                                ? ColorConstants.green
                                : ColorConstants.red,
                            width: 5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            widget.character.image,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      color:
                          widget.character.status == StringConstants.statusAlive
                              ? ColorConstants.green
                              : ColorConstants.red,
                    ),
                    child: Text(
                      widget.character.status,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ColorConstants.white,
                          ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Text(
                        StringConstants.properties,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ref.watch(themeProvider).isDarkTheme
                                      ? ColorConstants.white
                                      : ColorConstants.black,
                                ),
                      ),
                    ),
                    CustomRow(
                      ref: ref,
                      detail: widget.character.name,
                      caption: StringConstants.name,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomRow(
                        ref: ref,
                        detail: widget.character.gender,
                        caption: StringConstants.gender),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomRow(
                        ref: ref,
                        detail: widget.character.species,
                        caption: StringConstants.species),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomRow(
                        ref: ref,
                        detail: widget.character.status,
                        caption: StringConstants.status),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                      child: Text(
                        StringConstants.whereabouts,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ref.watch(themeProvider).isDarkTheme
                                      ? ColorConstants.white
                                      : ColorConstants.black,
                                ),
                      ),
                    ),
                    CustomRow(
                        ref: ref,
                        detail: widget.character.location.name,
                        caption: StringConstants.locationName),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomRow(
                        ref: ref,
                        detail: widget.character.origin.name,
                        caption: StringConstants.origin),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.ref,
    required this.detail,
    required this.caption,
  });

  final WidgetRef ref;
  final String detail;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.06,
          width: MediaQuery.sizeOf(context).width * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.withOpacity(0.2)),
          child: Center(
            child: Text(
              caption,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ref.watch(themeProvider).isDarkTheme
                        ? ColorConstants.white
                        : ColorConstants.black,
                  ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.05,
        ),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.06,
          width: MediaQuery.sizeOf(context).width * 0.6,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.withOpacity(0.2)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              detail,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ref.watch(themeProvider).isDarkTheme
                        ? ColorConstants.white
                        : ColorConstants.black,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
