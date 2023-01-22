import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class AddAssetUseCase {
  Future<Either<Failure, List<String>>> call(String asset);
}
