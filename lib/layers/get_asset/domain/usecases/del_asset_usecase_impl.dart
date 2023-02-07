// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../repositories/del_asset_repository.dart';
import 'del_asset_usecase.dart';

class DelAssetUseCaseImpl implements DelAssetUseCase {
  final DelAssetRepository _delAssetRepository;
  DelAssetUseCaseImpl(this._delAssetRepository);

  @override
  Future<Either<Failure, List<String>>> call(String asset) async {
    return await _delAssetRepository(asset);
  }
}
