// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/domain/entities/variation_entity.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/validate_asset_datasource.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/validate_asset_repository.dart';

import '../../../../core/domain/erros/error.dart';

class ValidateAssetRepositoryImpl implements ValidateAssetRepository {
  final ValidateAssetDataSource _validateAssetDataSource;
  ValidateAssetRepositoryImpl(this._validateAssetDataSource);

  @override
  Future<Either<Failure, List<VariationEntity>>> call(String asset) async {
    var dto = await _validateAssetDataSource.validate(asset);
    return dto.map((r) => r.toListEntity());
  }
}
