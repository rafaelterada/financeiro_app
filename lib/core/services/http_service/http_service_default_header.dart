class HttpServiceDefaultConfig {
  //construtor privado
  HttpServiceDefaultConfig._internal();

  //uma única instancia
  static final HttpServiceDefaultConfig _instance =
      HttpServiceDefaultConfig._internal();
  factory HttpServiceDefaultConfig() => _instance;

  Map<String, String>? defaultHeaders;

  bool get existsToken =>
      defaultHeaders == null ? false : defaultHeaders!.containsKey("token");
}
