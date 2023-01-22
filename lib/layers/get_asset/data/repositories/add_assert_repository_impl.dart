// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/add_asset_repository.dart';

import '../../../../core/domain/erros/error.dart';
import '../datasources/add_asset_datasource.dart';

class AddAssetRepositoryImpl implements AddAssetRepository {
  final AddAssetDataSource _addAssetDataSource;
  AddAssetRepositoryImpl(this._addAssetDataSource);

  @override
  Future<Either<Failure, List<String>>> call(String asset) async {
    return await _addAssetDataSource.addAsset(asset);
  }
}
