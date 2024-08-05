import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  void setTheme(bool theme) async
  {
    SharedPreferences share =await  SharedPreferences.getInstance();
    share.setBool("theme", theme);
  }

  Future<bool?> getTheme()
  async {
    SharedPreferences share =await SharedPreferences.getInstance();
  bool? theme =await  share.getBool("theme");
  return theme;
  }

  Future<void> setData(List<String> nameList,List<String> imageList)
  async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setStringList("nameList", nameList);
    share.setStringList("imageList", imageList);
  }

  Future<List<String>?> getData()
  async {
    SharedPreferences share =await SharedPreferences.getInstance();
   List<String>? nameList =await share.getStringList("nameList")??[];
  return nameList;
  }

  Future<List<String>?> getData2()
  async {
    SharedPreferences share =await SharedPreferences.getInstance();
    List<String>? imageList = await share.getStringList("imageList")??[];
    return imageList;
  }
}