// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:financeiro_app/layers/get_asset/domain/repositories/add_asset_repository.dart';

import '../../../../core/domain/erros/error.dart';
import 'add_asset_usecase.dart';

class AddAssetUseCaseImpl implements AddAssetUseCase {
  final AddAssetRepository _addAssetRepository;
  AddAssetUseCaseImpl(this._addAssetRepository);

  @override
  Future<Either<Failure, List<String>>> call(String asset) async {
    return await _addAssetRepository(asset);
  }
}
