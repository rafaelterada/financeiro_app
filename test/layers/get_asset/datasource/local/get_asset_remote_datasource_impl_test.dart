import 'package:financeiro_app/core/services/local_storage_service/local_storage_service.dart';
import 'package:financeiro_app/layers/get_asset/datasource/local/get_asset_local_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageServiceMock extends Mock implements LocalStorageService {}

void main() {
  final mock = LocalStorageServiceMock();

  test('Should return List<String>', () async {
    final datasource = GetAssetLocalDataSourceImpl(mock);

    when(() => mock.get(any())).thenAnswer((_) async => const <String>[]);

    var result = (await datasource.getAll()).fold(
      (l) => null,
      (r) => r,
    );

    expect(result, isA<List<String>>());
  });
}
