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
}