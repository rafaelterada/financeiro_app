import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';

abstract class AddAssetDataSource {
  Future<Either<Failure, List<String>>> addAsset(String asset);
}
