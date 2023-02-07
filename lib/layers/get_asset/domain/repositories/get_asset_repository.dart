import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';

abstract class GetAssetRepository {
  Future<Either<Failure, List<String>>> call();
}
