import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class DelAssetDataSource {
  Future<Either<Failure, List<String>>> delAsset(String asset);
}
