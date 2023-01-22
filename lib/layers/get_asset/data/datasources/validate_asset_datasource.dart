import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';
import '../dtos/variation_dto.dart';

abstract class ValidateAssetDataSource {
  Future<Either<Failure, VariationDto>> validate(String asset);
}
