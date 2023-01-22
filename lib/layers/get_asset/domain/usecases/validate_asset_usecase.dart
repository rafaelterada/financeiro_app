import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/domain/entities/variation_entity.dart';

import '../../../../core/domain/erros/error.dart';

abstract class ValidateAssetUseCase {
  Future<Either<Failure, List<VariationEntity>>> call(String asset);
}
