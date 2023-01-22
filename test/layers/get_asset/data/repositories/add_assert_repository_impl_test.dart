import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/add_asset_datasource.dart';
import 'package:financeiro_app/layers/get_asset/data/repositories/add_assert_repository_impl.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddAssetDataSourceMock extends Mock implements AddAssetDataSource {}

void main() {
  final mock = AddAssetDataSourceMock();

  test('Should add Asset', () async {
    final repository = AddAssetRepositoryImpl(mock);
    when(() => mock.addAsset(any()))
        .thenAnswer((_) async => const Right(<String>["aaa"]));
    var result = (await repository("")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<String>>());
  });

  test('Should return AddAssetError', () async {
    final repository = AddAssetRepositoryImpl(mock);
    when(() => mock.addAsset(any())).thenAnswer(
        (_) async => Left(AddAssetError(message: "Erro ao adicionar ativo")));
    var result = (await repository("")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<AddAssetError>());
  });
}
