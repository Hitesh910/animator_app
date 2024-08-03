import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animator App"),
      ),
      body: GridView.builder(
        itemCount: providerW!.planetList1.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 200,
            // color: Colors.red,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(
                        "${providerR!.planetList1[index].image}"))),
            child: Text("${providerR!.planetList1[index].name}"),
          );
        },
      ),
      drawer: Drawer(child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(children: [
              const Text("Theme"),
              Switch(value: providerW!.theme, onChanged: (value) {
                providerR!.changeTheme(value);
              },)
            ],)
          ],
        ),
      ),),
    );
  }
}
