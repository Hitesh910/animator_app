import 'package:animator_app/utils/helper/shared_helper.dart';
import 'package:animator_app/utils/json_helper.dart';
import 'package:flutter/material.dart';

import '../model/planet_model.dart';
class HomeProvider with ChangeNotifier
{
  List<PlanetModel> planetList1 = [];
  bool theme = false;
  bool? saveTheme;
  SharedHelper helper = SharedHelper();

  Future<void> getData()
  async {
    JsonHelper helper = JsonHelper();
    planetList1 =await helper.planetJson();
    print(planetList1);
    notifyListeners();
  }

  void changeTheme(bool value)
  {

    helper.setTheme(value);
    theme = value;
    notifyListeners();
  }

  Future<void> getTheme()
  async {
   saveTheme =await helper.getTheme();
   notifyListeners();
  }
}