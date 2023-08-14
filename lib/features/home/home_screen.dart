import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/constants/index.dart';
import '../../product/enums/png_enums.dart';
import '../../product/theme/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(PngEnums.header.toPng,height: MediaQuery.sizeOf(context).width * 0.1,width: MediaQuery.sizeOf(context).width * 0.6,fit:BoxFit.fill ,  ),
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
        ],
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
                      padding: EdgeInsets.all(16),
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
}