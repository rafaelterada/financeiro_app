import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';
import 'package:financeiro_app/layers/get_asset/datasource/local/add_asset_local_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageServiceMock extends Mock implements LocalStorageService {}

void main() {
  final mock = LocalStorageServiceMock();

  test('Should add Asset', () async {
    final datasource = AddAssetLocalDataSourceImpl(mock);

    when(() => mock.get(any())).thenAnswer((_) async => const <String>[]);

    when(() => mock.put(any(), any()))
        .thenAnswer((_) async => const <String>["aaa"]);

    var result = (await datasource.addAsset("aaa")).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<String>>());
  });
}
