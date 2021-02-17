import 'package:sarisaristore/core/source/source.dart';
import 'package:sarisaristore/core/model/paninda.dart';

abstract class ISariSariStoreRepository {
  Future<List<Paninda>> getItems();
}

class SariSariStoreRepository implements ISariSariStoreRepository {
  SariSariStoreRepository(this.localDataSource);

  final ISariStoreLocalDataSource localDataSource;

  @override
  Future<List<Paninda>> getItems() async {
    print('------------- Getting Repository -------------');
    return await localDataSource.getItems();
  }
}
