import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';

abstract class GetAssetUseCase {
  Future<Either<Failure, List<String>>> call();
}
