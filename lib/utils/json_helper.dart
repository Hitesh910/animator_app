import 'dart:convert';

import 'package:flutter/services.dart';

import '../screen/home/model/planet_model.dart';

class JsonHelper
{
  Future<List<PlanetModel>> planetJson()
  async {
    var data = await rootBundle.loadString("assets/json/planets.json");
    List json = jsonDecode(data);
    List<PlanetModel> planetList = json.map((e) => PlanetModel.mapToModel(e),).toList();
    print(planetList);
    return planetList;
  }
}