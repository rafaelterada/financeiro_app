import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/data/datasources/del_asset_datasource.dart';
import 'package:financeiro_app/layers/get_asset/data/repositories/del_assert_repository_impl.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DelAssetDataSourceMock extends Mock implements DelAssetDataSource {}

void main() {
  final mock = DelAssetDataSourceMock();

  test('Should del Asset', () async {
    final repository = DelAssetRepositoryImpl(mock);
    when(() => mock.delAsset(any()))
        .thenAnswer((_) async => const Right(<String>["aaa"]));
    var result = (await repository("")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<String>>());
  });

  test('Should return DelAssetError', () async {
    final repository = DelAssetRepositoryImpl(mock);
    when(() => mock.delAsset(any())).thenAnswer(
        (_) async => Left(DelAssetError(message: "Erro ao remover ativo")));
    var result = (await repository("")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<DelAssetError>());
  });
}
