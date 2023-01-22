import 'package:financeiro_app/core/services/http_service/http_service.dart';
import 'package:financeiro_app/core/services/http_service/response_http_service.dart';
import 'package:financeiro_app/layers/get_asset/data/dtos/variation_dto.dart';
import 'package:financeiro_app/layers/get_asset/datasource/remote/validate_asset_remote_datasource_impl.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  final mock = HttpServiceMock();

  test('Should return List<VariationDto>', () async {
    final dataSource = ValidateAssetRemoteDataSourceImpl(mock);

    var map = {
      "chart": {
        "result": [
          {
            "timestamp": [1, 2],
            "indicators": {
              "quote": [
                {
                  "close": [1.0, 2.0]
                }
              ]
            }
          }
        ]
      }
    };

    when(() => mock.get(any(), any())).thenAnswer(
        (_) async => ResponseHttpService(statusCode: 200, data: map));

    var result = (await dataSource.validate("")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<VariationDto>());
  });

  test('Should return AssetNotFound', () async {
    final dataSource = ValidateAssetRemoteDataSourceImpl(mock);

    when(() => mock.get(any(), any()))
        .thenAnswer((_) async => ResponseHttpService(statusCode: 404));

    var result = (await dataSource.validate("")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<AssetNotFound>());
  });
}
