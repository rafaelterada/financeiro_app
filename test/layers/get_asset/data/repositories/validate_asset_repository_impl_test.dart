import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/validate_asset_datasource.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/chart_dto.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/indicators_dto.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/quote_dto.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/result_dto.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/variation_dto.dart';
import 'package:financeiro_app/layers/get_asset/data/repositories/validate_asset_repository_impl.dart';
import 'package:financeiro_app/layers/get_asset/domain/entities/variation_entity.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ValidateAssetDataSourceMock extends Mock
    implements ValidateAssetDataSource {}

void main() {
  final mock = ValidateAssetDataSourceMock();

  test('Should return List<VariationEntity>', () async {
    final repository = ValidateAssetRepositoryImpl(mock);

    when(() => mock.validate(any())).thenAnswer((_) async => Right(
          VariationDto(
            chart: ChartDto(
              result: ResultDto(
                timestamp: [1, 2],
                indicators: IndicatorsDto(
                  quote: QuoteDto(
                    close: [1.0, 2.0],
                  ),
                ),
              ),
            ),
          ),
        ));

    var result = (await repository("")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<VariationEntity>>());
  });

  test('Should return ValidateAssetError', () async {
    final repository = ValidateAssetRepositoryImpl(mock);

    when(() => mock.validate(any())).thenAnswer((_) async =>
        Left(ValidateAssetError(message: "Erro ao validar ativo")));

    var result = (await repository("")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<ValidateAssetError>());
  });
}
