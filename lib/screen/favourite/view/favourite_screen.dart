import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getData1();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: providerW!.nameList.length,
            itemBuilder: (context, index) {
            return  Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${providerR!.imageList[index]}"))),
                    ),
                    Spacer(),
                    Text("${providerR!.nameList[index]}")
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
