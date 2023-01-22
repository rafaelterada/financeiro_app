import 'package:dartz/dartz.dart';
import 'package:financeiro_app/core/domain/entities/variation_entity.dart';
import 'package:financeiro_app/layers/get_asset/domain/errors/get_asset_error.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/validate_asset_repository.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/validate_asset_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ValidateAssetRepositoryMock extends Mock
    implements ValidateAssetRepository {}

void main() {
  final mock = ValidateAssetRepositoryMock();

  test('Should return List<VariationEntity>', () async {
    final useCase = ValidateAssetUseCaseImpl(mock);

    when(() => mock(any()))
        .thenAnswer((_) async => const Right(<VariationEntity>[]));

    var result = (await useCase("aaa")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<VariationEntity>>());
  });

  test('Should return ValidateAssetError', () async {
    final useCase = ValidateAssetUseCaseImpl(mock);

    when(() => mock(any())).thenAnswer((_) async =>
        Left(ValidateAssetError(message: 'Erro ao validar o ativo')));

    var result = (await useCase("aaa")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<ValidateAssetError>());
  });

  test('Should return ValidateAssetEmptyError', () async {
    final useCase = ValidateAssetUseCaseImpl(mock);

    var result = (await useCase("")).fold(
      (l) => l,
      (r) => null,
    );

    expect(result, isA<ValidateAssetEmptyError>());
  });
}
