import 'package:flutter/foundation.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/repositories/paninda_repository.dart';

class MainModel extends ChangeNotifier {
  MainModel(this.sariSariStoreRepository);

  final ISariSariStoreRepository sariSariStoreRepository;

  List<Paninda> _cacheStore = [];
  List<Paninda> snacksCategory = [];
  List<Paninda> seasoningsCategory = [];
  List<Paninda> coffeeCategory = [];
  List<Paninda> othersCategory = [];
  List<Paninda> isFavorite = [];

  Future<List<Paninda>> getItems() async {
    print('------------- Getting Items in Model -------------');

    if (_cacheStore.isEmpty) {
      var data = await sariSariStoreRepository.getItems();
      _cacheStore.addAll(data);
      notifyListeners();
    }
    tempSearch = _cacheStore;
    notifyListeners();
    return _cacheStore;
  }

  List<Paninda> tempSearch = [];

  searchProduct(String searchText) {
    if (searchText.isEmpty) {
      print('------------- Search Bar Empty -------------');
      tempSearch = _cacheStore;

      notifyListeners();
      return tempSearch;
    }

    tempSearch = _cacheStore
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
    return product;
  }

  _isFavorite(Paninda data) {
    if (data.isFavorite) isFavorite.add(data);
    return data;
  }

  //Separating The Category

}
