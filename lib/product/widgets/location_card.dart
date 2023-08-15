import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/color_constants.dart';
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
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          "Dimension: ",
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
                        child: Text(
                          location.dimension,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: ColorConstants
                                  .loginSubtitle),
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
                        flex: 1,
                        child: Text(
                          "Type: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: ref
                                  .watch(
                                  themeProvider)
                                  .isDarkTheme
                                  ? ColorConstants.white
                                  : ColorConstants
                                  .black),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          location.type,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: ColorConstants
                                  .loginSubtitle),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 12,
          ),
          onPressed: () {
          },
        ),
      ),
    );
  }
}