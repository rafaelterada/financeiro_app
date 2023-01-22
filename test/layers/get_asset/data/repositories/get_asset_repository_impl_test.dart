import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/get_asset_datasource.dart';
import 'package:financeiro_app/layers/get_asset/data/repositories/get_asset_repository_impl.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAssetDataSourceMock extends Mock implements GetAssetDataSource {}

void main() {
  final mock = GetAssetDataSourceMock();
  test('Should return List<AssetEntity>', () async {
    final repository = GetAssetRepositoryImpl(mock);

    when(() => mock.getAll()).thenAnswer((_) async => const Right(<String>[]));

    var result = (await repository()).fold(
      (l) => null,
      (r) => r,
    );
    expect(result, isA<List<String>>());
  });

  test('Should return GetAssetError', () async {
    final repository = GetAssetRepositoryImpl(mock);

    when(() => mock.getAll()).thenAnswer(
        (_) async => Left(GetAssetError(message: "Erro ao buscar Ativos")));

    var result = (await repository()).fold(
      (l) => l,
      (r) => null,
    );
    expect(result, isA<GetAssetError>());
  });
}
