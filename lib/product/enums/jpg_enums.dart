enum JpgEnums {
  splash('ic_splash');

  final String value;

  const JpgEnums(this.value);

  String get toJpg => 'assets/jpg/$value.jpg';
}
