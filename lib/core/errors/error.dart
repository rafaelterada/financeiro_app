abstract class Failure implements Exception {
  String get message;
}

class DataSourceError extends Failure {
  @override
  final String message;
  DataSourceError({this.message = "Erro no DataSource"});
}
