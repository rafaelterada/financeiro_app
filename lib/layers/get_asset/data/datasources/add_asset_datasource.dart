import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class AddAssetDataSource {
  Future<Either<Failure, List<String>>> addAsset(String asset);
}
