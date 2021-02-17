import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sarisaristore/core/model/paninda.dart';

abstract class ISariStoreLocalDataSource {
  Future<List<Paninda>> getItems();
}

class SariStoreLocalDataSource implements ISariStoreLocalDataSource {
  @override
  Future<List<Paninda>> getItems() async {
    try {
      String data = await rootBundle.loadString('assets/data/paninda.json');
      final result = json.decode(data);

      return List<Paninda>.from(
        result.map(
          (i) {
            print('------------- Mapping -------------');
            print(i);
            return Paninda.fromJson(i);
          },
        ),
      );
    } catch (e) {
      print('------------- Catching -------------');
      print(e);
      return [];
    }
  }
}
