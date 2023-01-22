import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class GetAssetUseCase {
  Future<Either<Failure, List<String>>> call();
}
