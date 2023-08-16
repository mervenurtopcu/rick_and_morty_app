enum LottieItems {
  loading,
  spin,
}

extension LottieExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.loading:
        return 'lottie_loading';
      case LottieItems.spin:
        return 'lottie_spin';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
