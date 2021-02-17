import 'package:sarisaristore/core/localsource/localsource.dart';
import 'package:sarisaristore/core/model/paninda.dart';

abstract class ISariSariStoreRepository {
  Future<List<Paninda>> getItems();
}

class SariSariStoreRepository implements ISariSariStoreRepository {
  SariSariStoreRepository(this.localDataSource);

  final ISariStoreLocalDataSource localDataSource;

  @override
  Future<List<Paninda>> getItems() async {
    var a = await localDataSource.getItems();
    print('------------- Getting Repository -------------');
    print(a);
    return a;
  }
}
