class AppConfig {
  AppConfig._internal();
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;

  String baseUrl = "https://query2.finance.yahoo.com/v8/finance/chart/";
}
