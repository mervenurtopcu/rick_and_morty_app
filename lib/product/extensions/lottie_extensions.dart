enum LottieItems {
  //TODO: Add lottie json file and write the name here
  loading,
}

extension LottieExtension on LottieItems {
  //TODO: Define the path of the lottie json file and write in the switch case
  String _path() {
    switch (this) {
      case LottieItems.loading:
        return 'lottie_loading';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}