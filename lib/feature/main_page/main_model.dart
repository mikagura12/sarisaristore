import 'package:flutter/foundation.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/repositories/paninda_repository.dart';

class MainModel extends ChangeNotifier {
  MainModel(this.sariSariStoreRepository);

  final ISariSariStoreRepository sariSariStoreRepository;

  final List<Paninda> cacheStore = [];
  List<Paninda> snacksCategory = [];
  List<Paninda> seasoningsCategory = [];
  List<Paninda> othersCategory = [];
  List<Paninda> isFavorite = [];

  Future<List<Paninda>> getItems() async {
    if (cacheStore.isEmpty) {
      var data = await sariSariStoreRepository.getItems();
      cacheStore.addAll(data);
    }
    notifyListeners();
    return cacheStore;
  }

  categoryFilter(Paninda data) {
    if (data.category.toLowerCase() == 'snack') {
      snacksCategory.add(data);
      _isFavorite(data);
    } else if (data.category.toLowerCase() == 'seasonings') {
      seasoningsCategory.add(data);
      _isFavorite(data);
    } else {
      othersCategory.add(data);
      _isFavorite(data);
    }
  }

  _isFavorite(Paninda data) {
    if (data.isFavorite) isFavorite.add(data);
    return data;
  }
}
