import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sarisaristore/core/constant/string.dart';
import 'package:sarisaristore/core/model/paninda.dart';

abstract class ISariStoreLocalDataSource {
  Future<List<Paninda>> getItems();
}

class SariStoreLocalDataSource implements ISariStoreLocalDataSource {
  List remoteResult = [];

  @override
  Future<List<Paninda>> getItems() async {
    try {
      Response cofeeJuices = await http.get(urlCofeeJuices);
      Response foods = await http.get(urlFoods);
      Response materials = await http.get(urlMaterials);
      Response seasoningFlavors = await http.get(urlSeasoningFlavors);
      Response snacks = await http.get(urlSnacks);
      Response washingCleaning = await http.get(urlWashingCleaning);
      List<Response> responseList = [
        cofeeJuices,
        foods,
        materials,
        seasoningFlavors,
        snacks,
        washingCleaning
      ];

      responseList.forEach((response) {
        var result = json.decode(response.body);
        print(result.runtimeType);
        remoteResult += result;
      });
      print(remoteResult);
      // Testing Purpose
      print('------------- Inserting Json -------------');
      return List<Paninda>.from(
        remoteResult.map(
          (i) {
            return Paninda.fromJson(i);
          },
        ),
      );
    } catch (e) {
      print('------------- Error Detected -------------\n$e');
      String data = await rootBundle.loadString('assets/data/paninda.json');
      final localResult = json.decode(data);
      return List<Paninda>.from(
        localResult.map(
          (i) {
            return Paninda.fromJson(i);
          },
        ),
      );
    }
  }
}
