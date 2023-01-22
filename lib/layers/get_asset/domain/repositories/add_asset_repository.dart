import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class AddAssetRepository {
  Future<Either<Failure, List<String>>> call(String asset);
}
