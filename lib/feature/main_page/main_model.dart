import 'package:flutter/foundation.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/repositories/paninda_repository.dart';

class MainModel extends ChangeNotifier {
  MainModel(this.sariSariStoreRepository);

  final ISariSariStoreRepository sariSariStoreRepository;

  final List<Paninda> cacheStore = [];

  Future<List<Paninda>> getItems() async {
    if (cacheStore.isEmpty) {
      print('------------- Updating List -------------');
      var data = await sariSariStoreRepository.getItems();
      cacheStore.addAll(data);
    }
    print('------------- Updating List -------------');

    return cacheStore;
  }
}
