import 'package:financeiro_app/core/domain/entities/variation_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/menu_platform_channel.dart';
import '../domain/usecases/add_asset_usecase.dart';
import '../domain/usecases/del_asset_usecase.dart';
import '../domain/usecases/get_asset_usecase.dart';
import '../domain/usecases/validate_asset_usecase.dart';

class GetAssetController extends GetxController with StateMixin<List<String>> {
  final GetAssetUseCase _getAssetUseCase;
  final ValidateAssetUseCase _validateAssetUseCase;
  final AddAssetUseCase _addAssetUseCase;
  final DelAssetUseCase _delAssetUseCase;
  GetAssetController(this._getAssetUseCase, this._addAssetUseCase,
      this._validateAssetUseCase, this._delAssetUseCase);

  @override
  onInit() {
    super.onInit();
    fillList();
  }

  fillList() async {
    var result = await _getAssetUseCase();
    result.fold(
      (error) => change(<String>[], status: RxStatus.error(error.message)),
      (success) {
        if (success.isEmpty) {
          return change(success, status: RxStatus.empty());
        }
        return change(success, status: RxStatus.success());
      },
    );
  }

  String newAsset = "";
  List<VariationEntity> variationList = [];

  onChangeNewAsset(String value) {
    newAsset = value;
  }

  addAssetClick() async {
    if (!state!.contains(newAsset.toUpperCase())) {
      var resultValidate = await _validateAssetUseCase(newAsset);
      resultValidate.fold(
        (validateError) => Get.defaultDialog(
            title: "Atenção", content: Text(validateError.message)),
        (validateSuccess) async {
          variationList = validateSuccess;
          var resultAdd = await _addAssetUseCase(newAsset);
          return resultAdd.fold(
            (addError) => Get.defaultDialog(
                title: "Atenção", content: Text(addError.message)),
            (addSuccess) async {
              change(addSuccess, status: RxStatus.success());
              openMenu(newAsset.toUpperCase());
            },
          );
        },
      );
    } else {
      openMenu(newAsset.toUpperCase());
    }
  }

  selectAssetClick(String asset) async {
    var resultValidate = await _validateAssetUseCase(asset);
    resultValidate.fold(
      (validateError) => Get.defaultDialog(
          title: "Atenção", content: Text(validateError.message)),
      (validateSuccess) async {
        variationList = validateSuccess;
        openMenu(asset.toUpperCase());
      },
    );
  }

  delAssetClick(String asset) async {
    change(null, status: RxStatus.loading());
    var result = await _delAssetUseCase(asset);
    result.fold(
      (error) => change(null, status: RxStatus.error("Erro ao excluir ativo")),
      (success) => change(success, status: RxStatus.success()),
    );
  }

  openMenu(String asset) async {
    final menuPlatformChannel = MenuPlatformChannel();
    var result = await menuPlatformChannel.callMenuChannel();
    if (result == "variacao") {
      Get.toNamed('/list_variation', arguments: [asset, variationList])
          ?.then((value) => openMenu(asset));
    } else if (result == "grafico") {
      Get.toNamed('/graph_variation', arguments: [asset, variationList])
          ?.then((value) => openMenu(asset));
    } else if (result == "voltar") {}
  }
}
