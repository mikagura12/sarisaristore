import 'package:flutter/foundation.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/repositories/paninda_repository.dart';

class MainModel extends ChangeNotifier {
  MainModel(this.sariSariStoreRepository);

  final ISariSariStoreRepository sariSariStoreRepository;

  List<Paninda> cacheStore = [];
  List<Paninda> snacksCategory = [];
  List<Paninda> seasoningsCategory = [];
  List<Paninda> coffeeCategory = [];
  List<Paninda> othersCategory = [];
  List<Paninda> isFavorite = [];

  Future<List<Paninda>> getItems() async {
    print('------------- Getting Items in Model -------------');

    if (cacheStore.isEmpty) {
      var data = await sariSariStoreRepository.getItems();
      cacheStore.addAll(data);
      notifyListeners();
    }
    tempSearch = cacheStore;
    notifyListeners();
    return cacheStore;
  }

  List<Paninda> tempSearch = [];
  searchProduct(String searchText) {
    if (searchText.isEmpty) {
      print('------------- Search Bar Empty -------------');
      notifyListeners();
      return tempSearch = cacheStore;
    }

    tempSearch = snacksCategory
        .where((product) => product.item.toLowerCase().contains('$searchText'))
        .toList();

    print('Results $tempSearch');
    notifyListeners();
  }

  categoryFilter(Paninda data) {
    if (data.category.toLowerCase() == 'snack') {
      print('------------- Filtering Snack -------------');
      _duplicateFilter(data, snacksCategory);
    } else if (data.category.toLowerCase() == 'seasonings') {
      print('------------- Filtering Seasongs -------------');
      _duplicateFilter(data, seasoningsCategory);
    } else if (data.category.toLowerCase() == 'coffee') {
      print('------------- Filtering Coffee -------------');
      _duplicateFilter(data, coffeeCategory);
    } else {
      print('------------- Filtering Others -------------');
      _duplicateFilter(data, othersCategory);
    }
  }

  _duplicateFilter(Paninda data, List<Paninda> product) {
    if (!seasoningsCategory.contains(data)) {
      product.add(data);
      _isFavorite(data);
    }
  }

  _isFavorite(Paninda data) {
    if (data.isFavorite) isFavorite.add(data);
    return data;
  }

  //Separating The Category

}
