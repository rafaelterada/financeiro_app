import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class GetAssetRepository {
  Future<Either<Failure, List<String>>> call();
}
