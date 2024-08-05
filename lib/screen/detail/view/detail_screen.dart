import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  int? index;
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController!.repeat(reverse: false);
    animationController!.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)!.settings.arguments as int;
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Deatail"),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/gif/planet.gif"),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotationTransition(
                  turns: animationController!,
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${providerR!.planetList1[index!].image}"))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    AnimatedTextKit(repeatForever: false,pause: Duration(seconds: 4),isRepeatingAnimation: false,
                      animatedTexts: [
                        WavyAnimatedText(
                          "${providerR!.planetList1[index!].name}",
                          textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      providerR!.setData(providerR!.planetList1[index!].name!, providerR!.planetList1[index!].image!);
                    }, icon: Icon(Icons.favorite))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "${providerR!.planetList1[index!].description}",
                      textStyle:TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
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
