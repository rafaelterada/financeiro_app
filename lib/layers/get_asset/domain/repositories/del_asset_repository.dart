import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class DelAssetRepository {
  Future<Either<Failure, List<String>>> call(String asset);
}
