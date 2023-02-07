// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/get_asset_datasource.dart';

import '../../../../core/errors/error.dart';
import '../../domain/repositories/get_asset_repository.dart';

class GetAssetRepositoryImpl implements GetAssetRepository {
  final GetAssetDataSource _assetDataSource;
  GetAssetRepositoryImpl(this._assetDataSource);

  @override
  Future<Either<Failure, List<String>>> call() async {
    var result = await _assetDataSource.getAll();
    return result;
  }
}
