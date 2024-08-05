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
  List<String> nameList = [];
  List<String> imageList = [];

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

  Future<void> setData(String name,String image)
  async {
    List<String>? nameList =await helper.getData();
    List<String>? imageList =await helper.getData2();

    nameList!.add(name);
    imageList!.add(image);

    helper.setData(nameList, imageList);
    notifyListeners();
  }

  Future<void> getData1()
  async {
    var name1 =await helper.getData();
    var image1 =await helper.getData2();

    if(name1 != null && image1 != null)
      {
        nameList = name1;
        imageList = image1;
      }
    notifyListeners();
  }
}