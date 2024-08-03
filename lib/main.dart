import 'package:animator_app/screen/home/provider/home_provider.dart';
import 'package:animator_app/screen/home/view/home_screen.dart';
import 'package:animator_app/utils/app_routes.dart';
import 'package:animator_app/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: HomeProvider())],
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
        return  MaterialApp(
            theme:value.theme == false ?light:dark,
            routes: app_routes,
          );
        },
      ),
    ),
  );
}
