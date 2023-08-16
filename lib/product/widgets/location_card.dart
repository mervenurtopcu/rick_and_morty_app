import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/color_constants.dart';
import '../constants/string_constants.dart';
import '../models/location_model.dart';
import '../theme/theme_provider.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.location,
    required this.ref,
  });

  final LocationModel location;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 0,
      shadowColor: ColorConstants.grey,
      child: ListTile(
        title: Text(
          location.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          StringConstants.dimension,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: ref.watch(themeProvider).isDarkTheme
                                      ? ColorConstants.white
                                      : ColorConstants.black),
                        )),
                    Expanded(
                        child: Text(
                      location.dimension,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorConstants.darkGray),
                    )),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text(
                      StringConstants.type,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ref.watch(themeProvider).isDarkTheme
                              ? ColorConstants.white
                              : ColorConstants.black),
                    )),
                    Expanded(
                        child: Text(
                      location.type,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorConstants.darkGray),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
