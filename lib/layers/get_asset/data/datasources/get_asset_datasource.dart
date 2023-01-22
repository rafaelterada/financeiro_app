import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/error.dart';

abstract class GetAssetDataSource {
  Future<Either<Failure, List<String>>> getAll();
}
