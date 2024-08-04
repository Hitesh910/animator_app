import 'package:animator_app/screen/detail/view/detail_screen.dart';
import 'package:animator_app/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "detail":(context) => DetailScreen(),
};