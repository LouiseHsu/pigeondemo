import 'package:flutter/material.dart';
import 'package:pigeon_demo/src/messages.g.dart';

DemoApi hostApi = DemoApi();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pigeonText = "";
  int pigeonSize = 0;

  _MyAppState() {
    hostApi.getPigeonStats().then((val) => setState(() {
      // pigeonText = val;
    }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/pigeon.png"),
              TextButton(onPressed: () => hostApi.pokePigeon(), child: Text("Poke!")),
            ],
          ),
        ),
      ),
    );
  }
}
