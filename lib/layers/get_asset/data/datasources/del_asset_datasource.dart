import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';

abstract class DelAssetDataSource {
  Future<Either<Failure, List<String>>> delAsset(String asset);
}
