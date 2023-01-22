import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/add_asset_repository.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/add_asset_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddAssetRepositoryMock extends Mock implements AddAssetRepository {}

void main() {
  final mock = AddAssetRepositoryMock();
  test('Should add Asset', () async {
    final useCase = AddAssetUseCaseImpl(mock);
    when(() => mock(any())).thenAnswer((_) async => const Right(<String>[]));

    var result = (await useCase("")).fold(
      (l) => null,
      (r) => r,
    );
    expect(result, isA<List<String>>());
  });

  test('Should return AddAssetError', () async {
    final useCase = AddAssetUseCaseImpl(mock);
    when(() => mock(any())).thenAnswer(
        (_) async => Left(AddAssetError(message: "Erro ao adicionar")));

    var result = (await useCase("")).fold(
      (l) => l,
      (r) => null,
    );
    expect(result, isA<AddAssetError>());
  });
}
