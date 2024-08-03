import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getData();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    animationController!.repeat(reverse: false);
    animationController!.addListener(() {
      setState(() {

      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animator App"),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/gif/planet.gif"),
                    fit: BoxFit.fill)),
          ),
          GridView.builder(
            itemCount: providerW!.planetList1.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    // color: Colors.red,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      gradient: LinearGradient(colors: [
                        Colors.white54,
                        Colors.transparent.withOpacity(0.1)
                      ]),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //       "${providerR!.planetList1[index].image}"),
                      // ),
                    ),
                    child: index != 8 ?RotationTransition(
                      turns: animationController!,
                      child: Image(
                        image: NetworkImage(
                            "${providerR!.planetList1[index].image}"),height: 120,width: 120,
                      ),
                    )
                    : Image(image: NetworkImage("${providerR!.planetList1[index].image}"))
                  ),
                  Text(
                    "${providerR!.planetList1[index].name}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Theme"),
                  Switch(
                    value: providerW!.theme,
                    onChanged: (value) {
                      providerR!.changeTheme(value);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();
  }
}
