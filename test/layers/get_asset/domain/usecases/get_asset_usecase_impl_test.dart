import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/get_asset_repository.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/get_asset_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAssetRepositoryMock extends Mock implements GetAssetRepository {}

void main() {
  final mock = GetAssetRepositoryMock();

  test("Should return List<AssetEntity>", () async {
    final useCase = GetAssetUseCaseImpl(mock);
    when(() => mock()).thenAnswer((_) async => const Right(<String>[]));

    var result = (await useCase()).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<String>>());
  });

  test("Should return GetAssetError", () async {
    final useCase = GetAssetUseCaseImpl(mock);

    when(() => mock()).thenAnswer(
        (_) async => Left(GetAssetError(message: "Erro ao buscar Ativos")));

    var result = (await useCase()).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<GetAssetError>());
  });
}
