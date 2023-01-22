import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/del_asset_repository.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/del_asset_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DelAssetRepositoryMock extends Mock implements DelAssetRepository {}

void main() {
  final mock = DelAssetRepositoryMock();
  test('Should remove item list', () async {
    final useCase = DelAssetUseCaseImpl(mock);
    when(() => mock(any()))
        .thenAnswer((_) async => const Right(["aaa", "bbb"]));
    var result = (await useCase("bbb")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<String>>());
  });

  test('Should retrun error', () async {
    final useCase = DelAssetUseCaseImpl(mock);
    when(() => mock(any()))
        .thenAnswer((_) async => Left(DelAssetError(message: "Erro")));
    var result = (await useCase("bbb")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<DelAssetError>());
  });
}
