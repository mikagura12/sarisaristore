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
      final localResult = json.decode(data); // Testing Purpose
      print('------------- Inserting Json -------------');
      return List<Paninda>.from(
        localResult.map(
          (i) {
            return Paninda.fromJson(i);
          },
        ),
      );
    } catch (e) {
      print('------------- Error Detected -------------\n$e');
      return [];
    }
  }
}
