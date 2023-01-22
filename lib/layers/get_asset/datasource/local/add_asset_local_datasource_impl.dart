// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';

import '../../../../core/domain/erros/error.dart';
import '../../data/datasources/add_asset_datasource.dart';

class AddAssetLocalDataSourceImpl implements AddAssetDataSource {
  final LocalStorageService _localStorageService;
  AddAssetLocalDataSourceImpl(this._localStorageService);

  @override
  Future<Either<Failure, List<String>>> addAsset(String asset) async {
    try {
      var listDynamic = await _localStorageService.get("assets");

      if (listDynamic is List<dynamic> && listDynamic.isNotEmpty) {
        var list = listDynamic.map((e) => e.toString()).toList();
        list.add(asset.toUpperCase());
        list.sort((a, b) {
          return a.toUpperCase().compareTo(b.toUpperCase());
        });
        await _localStorageService.put("assets", list);
        return Right(list);
      } else {
        var list = [asset.toUpperCase()];
        await _localStorageService.put("assets", list);
        return Right(list);
      }
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
