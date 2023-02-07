import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../dtos/variation_dto.dart';

abstract class ValidateAssetDataSource {
  Future<Either<Failure, VariationDto>> validate(String asset);
}
