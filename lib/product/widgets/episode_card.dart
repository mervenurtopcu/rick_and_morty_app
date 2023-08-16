import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/product/constants/index.dart';
import '../models/episode_model.dart';
import '../theme/theme_provider.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    super.key,
    required this.episode,
    required this.ref,
  });

  final Episode episode;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 0,
      shadowColor: ColorConstants.grey,
      child: ListTile(
        title: Text(
          episode.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    StringConstants.episode,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ref.watch(themeProvider).isDarkTheme
                            ? ColorConstants.white
                            : ColorConstants.black),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    episode.episode,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ColorConstants.darkGray),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
