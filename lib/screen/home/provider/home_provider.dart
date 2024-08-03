import 'package:animator_app/utils/json_helper.dart';
import 'package:flutter/material.dart';

import '../model/planet_model.dart';
class HomeProvider with ChangeNotifier
{
  List<PlanetModel> planetList1 = [];
  bool theme = false;

  Future<void> getData()
  async {
    JsonHelper helper = JsonHelper();
    planetList1 =await helper.planetJson();
    print(planetList1);
    notifyListeners();
  }

  void changeTheme(bool value)
  {
    theme = value;
    notifyListeners();
  }
}