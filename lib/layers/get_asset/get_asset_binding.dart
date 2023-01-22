import 'package:financeiro_app/core/services/http_service/dio_http_service_impl.dart';
import 'package:financeiro_app/core/services/http_service/http_service.dart';
import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';
import 'package:financeiro_app/core/services/local_storage_service/shared_preferences_service_impl.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/get_asset_usecase.dart';
import 'package:financeiro_app/layers/get_asset/domain/usecases/get_asset_usecase_impl.dart';
import 'package:financeiro_app/layers/get_asset/presentation/get_asset_controller.dart';
import 'package:get/get.dart';

import 'data/datasources/add_asset_datasource.dart';
import 'data/datasources/del_asset_datasource.dart';
import 'data/datasources/get_asset_datasource.dart';
import 'data/datasources/validate_asset_datasource.dart';
import 'data/repositories/add_assert_repository_impl.dart';
import 'data/repositories/del_assert_repository_impl.dart';
import 'data/repositories/get_asset_repository_impl.dart';
import 'data/repositories/validate_asset_repository_impl.dart';
import 'datasource/local/add_asset_local_datasource_impl.dart';
import 'datasource/local/del_asset_local_datasource_impl.dart';
import 'datasource/local/get_asset_local_datasource_impl.dart';
import 'datasource/remote/validate_asset_remote_datasource_impl.dart';
import 'domain/repositories/add_asset_repository.dart';
import 'domain/repositories/del_asset_repository.dart';
import 'domain/repositories/get_asset_repository.dart';
import 'domain/repositories/validate_asset_repository.dart';
import 'domain/usecases/add_asset_usecase.dart';
import 'domain/usecases/add_asset_usecase_impl.dart';
import 'domain/usecases/del_asset_usecase.dart';
import 'domain/usecases/del_asset_usecase_impl.dart';
import 'domain/usecases/validate_asset_usecase.dart';
import 'domain/usecases/validate_asset_usecase_impl.dart';

class GetAssetBinding implements Bindings {
  @override
  void dependencies() {
    //services
    Get.put<LocalStorageService>(SharedPreferencesServiceImpl());

    Get.put<HttpService>(DioHttpServiceImpl());

    //datasources
    Get.put<AddAssetDataSource>(AddAssetLocalDataSourceImpl(Get.find()));

    Get.put<DelAssetDataSource>(DelAssetLocalDataSourceImpl(Get.find()));

    Get.put<GetAssetDataSource>(GetAssetLocalDataSourceImpl(Get.find()));

    Get.put<ValidateAssetDataSource>(
        ValidateAssetRemoteDataSourceImpl(Get.find()));

    //repositories
    Get.put<AddAssetRepository>(AddAssetRepositoryImpl(Get.find()));

    Get.put<DelAssetRepository>(DelAssetRepositoryImpl(Get.find()));

    Get.put<GetAssetRepository>(GetAssetRepositoryImpl(Get.find()));

    Get.put<ValidateAssetRepository>(ValidateAssetRepositoryImpl(Get.find()));

    //usecases
    Get.put<AddAssetUseCase>(AddAssetUseCaseImpl(Get.find()));

    Get.put<DelAssetUseCase>(DelAssetUseCaseImpl(Get.find()));

    Get.put<GetAssetUseCase>(GetAssetUseCaseImpl(Get.find()));

    Get.put<ValidateAssetUseCase>(ValidateAssetUseCaseImpl(Get.find()));

    //controllers
    Get.lazyPut<GetAssetController>(() =>
        GetAssetController(Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
