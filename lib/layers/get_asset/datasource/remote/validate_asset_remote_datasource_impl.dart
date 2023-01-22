// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/app_config.dart';
import 'package:financeiro_app/core/services/http_service/http_service.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/validate_asset_datasource.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/variation_dto.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';

import '../../../../core/domain/erros/error.dart';

class ValidateAssetRemoteDataSourceImpl implements ValidateAssetDataSource {
  final HttpService _httpService;
  ValidateAssetRemoteDataSourceImpl(this._httpService);

  @override
  Future<Either<Failure, VariationDto>> validate(String asset) async {
    var lastMonth = DateTime.now()
            .subtract(const Duration(days: 30))
            .toLocal()
            .millisecondsSinceEpoch ~/
        1000;
    var currentDate = DateTime.now().toLocal().millisecondsSinceEpoch ~/ 1000;

    var result = await _httpService.get(AppConfig().baseUrl,
        "/$asset?interval=1d&period1=$lastMonth&period2=$currentDate");
    if (result.statusCode == 200) {
      var obj = VariationDto.fromMap(result.data);
      if (obj.chart?.result?.timestamp != null) {
        return Right(obj);
      }
      return Left(AssetNotFound(message: "Ativo não encontrado"));
    } else if (result.statusCode == 404) {
      return Left(AssetNotFound(message: "Ativo não encontrado"));
    } else {
      return Left(ValidateAssetError(message: 'Erro ao validar o ativo'));
    }
  }
}
