// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/domain/entities/variation_entity.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/validate_asset_repository.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/validate_asset_usecase.dart';

import '../../../../core/domain/erros/error.dart';
import '../errors/get_asset_error.dart';

class ValidateAssetUseCaseImpl implements ValidateAssetUseCase {
  final ValidateAssetRepository _validateAssetRepository;
  ValidateAssetUseCaseImpl(this._validateAssetRepository);

  @override
  Future<Either<Failure, List<VariationEntity>>> call(String asset) async {
    if (asset.isEmpty) {
      return Left(
          ValidateAssetEmptyError(message: "Digite um ativo para pesquisar"));
    }
    return await _validateAssetRepository(asset);
  }
}
