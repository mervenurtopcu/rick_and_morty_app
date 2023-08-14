enum PngEnums {
  header('ic_app_header')
  ;

  final String value;

  const PngEnums(this.value);

  String get toPng => 'assets/png/$value.png';
}