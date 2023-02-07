import '../../../../core/errors/error.dart';

class GetAssetError extends Failure {
  @override
  final String message;
  GetAssetError({
    required this.message,
  });
}

class ValidateAssetError extends Failure {
  @override
  final String message;
  ValidateAssetError({
    required this.message,
  });
}

class ValidateAssetEmptyError extends Failure {
  @override
  final String message;
  ValidateAssetEmptyError({
    required this.message,
  });
}

class AssetNotFound extends Failure {
  @override
  final String message;
  AssetNotFound({
    required this.message,
  });
}

class AssetAlreadyExists extends Failure {
  @override
  final String message;
  AssetAlreadyExists({
    required this.message,
  });
}

class AddAssetError extends Failure {
  @override
  final String message;
  AddAssetError({
    required this.message,
  });
}

class DelAssetError extends Failure {
  @override
  final String message;
  DelAssetError({
    required this.message,
  });
}
