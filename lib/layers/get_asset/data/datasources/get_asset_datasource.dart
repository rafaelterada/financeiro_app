import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';

abstract class GetAssetDataSource {
  Future<Either<Failure, List<String>>> getAll();
}
