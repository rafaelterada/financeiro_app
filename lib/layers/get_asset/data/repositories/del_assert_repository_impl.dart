// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/del_asset_repository.dart';

import '../../../../core/domain/erros/error.dart';
import '../datasources/del_asset_datasource.dart';

class DelAssetRepositoryImpl implements DelAssetRepository {
  final DelAssetDataSource _delAssetDataSource;
  DelAssetRepositoryImpl(this._delAssetDataSource);

  @override
  Future<Either<Failure, List<String>>> call(String asset) async {
    return await _delAssetDataSource.delAsset(asset);
  }
}
