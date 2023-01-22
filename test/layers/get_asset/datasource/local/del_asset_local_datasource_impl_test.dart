import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';
import 'package:financeiro_app/layers/get_asset/datasource/local/del_asset_local_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageServiceMock extends Mock implements LocalStorageService {}

void main() {
  final mock = LocalStorageServiceMock();

  test('Should del Asset', () async {
    final datasource = DelAssetLocalDataSourceImpl(mock);

    when(() => mock.get(any())).thenAnswer((_) async => const <String>["AAA"]);

    when(() => mock.put(any(), any()))
        .thenAnswer((_) async => const <String>[]);

    var result = (await datasource.delAsset("aaa")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result!.isEmpty, true);
  });
}
