// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';

import '../../../../core/domain/erros/error.dart';
import '../../data/datasources/del_asset_datasource.dart';

class DelAssetLocalDataSourceImpl implements DelAssetDataSource {
  final LocalStorageService _localStorageService;
  DelAssetLocalDataSourceImpl(this._localStorageService);

  @override
  Future<Either<Failure, List<String>>> delAsset(String asset) async {
    try {
      var listDynamic = await _localStorageService.get("assets");

      if (listDynamic is List<dynamic> && listDynamic.isNotEmpty) {
        var list = listDynamic.map((e) => e.toString().toUpperCase()).toList();
        list.remove(asset.toUpperCase());
        list.sort((a, b) {
          return a.toUpperCase().compareTo(b.toUpperCase());
        });
        await _localStorageService.put("assets", list);
        return Right(list);
      }
      return Left(DataSourceError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
