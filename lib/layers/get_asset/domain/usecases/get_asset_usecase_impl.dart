// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/get_asset_repository.dart';

import '../../../../core/domain/erros/error.dart';
import 'get_asset_usecase.dart';

class GetAssetUseCaseImpl implements GetAssetUseCase {
  final GetAssetRepository _getAssetRepository;
  GetAssetUseCaseImpl(this._getAssetRepository);

  @override
  Future<Either<Failure, List<String>>> call() async {
    return await _getAssetRepository();
  }
}
