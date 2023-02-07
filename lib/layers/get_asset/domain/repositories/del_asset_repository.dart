import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';

abstract class DelAssetRepository {
  Future<Either<Failure, List<String>>> call(String asset);
}
