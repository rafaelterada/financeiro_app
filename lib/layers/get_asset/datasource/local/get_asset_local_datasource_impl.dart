// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';

import '../../../../core/domain/erros/error.dart';
import '../../data/datasources/get_asset_datasource.dart';

class GetAssetLocalDataSourceImpl implements GetAssetDataSource {
  final LocalStorageService _localStorageService;
  GetAssetLocalDataSourceImpl(this._localStorageService);

  @override
  Future<Either<Failure, List<String>>> getAll() async {
    try {
      var listDynamic = await _localStorageService.get("assets");

      if (listDynamic is List<dynamic> && listDynamic.isNotEmpty) {
        var list = listDynamic.map((e) => e.toString()).toList();
        list.sort((a, b) {
          return a.toUpperCase().compareTo(b.toUpperCase());
        });
        return Right(list);
      } else {
        return const Right(<String>[]);
      }
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
