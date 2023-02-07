import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../entities/variation_entity.dart';

abstract class ValidateAssetUseCase {
  Future<Either<Failure, List<VariationEntity>>> call(String asset);
}
