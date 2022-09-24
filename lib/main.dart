
import 'package:flutter/material.dart';
import 'package:new_wear_os/constant.dart';
import 'package:new_wear_os/screens/start_screen.dart';
import 'package:new_wear_os/wear.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Wear App',
        theme: ThemeData(
          primarySwatch: Colors.green,//Color.fromRGBO(147, 20, 13, 1),
        ),
        home: WatchScreen(),
        debugShowCheckedModeBanner: false,
      );
}

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (context, shape) => InheritedShape(
              shape: shape,
              child: AmbientMode(
                builder: (context, mode) =>
                    StartScreen(),
              ),
            ),
      );
}
