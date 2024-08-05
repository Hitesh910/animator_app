import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
          () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network("https://media.istockphoto.com/id/1158571608/vector/solar-panel-logo-vector.jpg?s=612x612&w=0&k=20&c=0LwgOEX9CathKI8GDyFnmQOvTo5DisNvdeV1JjyVCTA=",height: 100,width: 100,),
          ),
          Text("Planet App"),
        ],
      ),
    );
  }
}
