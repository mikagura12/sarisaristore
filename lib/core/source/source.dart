import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sarisaristore/core/constant/string.dart';
// import 'package:flutter/services.dart';
import 'package:sarisaristore/core/model/paninda.dart';

abstract class ISariStoreLocalDataSource {
  Future<List<Paninda>> getItems();
}

class SariStoreLocalDataSource implements ISariStoreLocalDataSource {
  @override
  Future<List<Paninda>> getItems() async {
    try {
      var response = await http.get(url);
      final remoteResult = json.decode(response.body);

      /* String data = await rootBundle.loadString('assets/data/paninda.json');
      final localResult = json.decode(data); */ // Testing Purpose

      print('------------- Inserting Json -------------');
      return List<Paninda>.from(
        remoteResult.map(
          (i) {
            return Paninda.fromJson(i);
          },
        ),
      );
    } catch (e) {
      print('------------- Error Detected -------------\n $e');
      return [];
    }
  }
}
