import 'package:flutter/material.dart';
import 'package:new_wear_os/utils.dart';
import 'package:new_wear_os/wear.dart';
import 'package:new_wear_os/constant.dart';

import 'package:new_wear_os/screens/name_screen.dart';
class StartScreen extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  StartScreen(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode) => NameScreenUI(screenHeight, screenWidth),
      // builder: (context, mode) => mode == Mode.active
      //     ? NameScreenUI(screenHeight, screenWidth)
      //     : AmbientWatchFace(),
    );
  }
}

class StartScreenUI extends StatelessWidget {
  // final screenHeight;
  // final screenWidth;
  StartScreenUI();
  // StartScreenUI(this.screenHeight, this.screenWidth);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            // boxInsetLength requires radius, so divide by 2
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
        
            child: Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Image.asset('assets/images/logo.png', width: 75, height: 75),
                  // child: Image.asset('assets/images/logo.png'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    // highlightColor: Colors.blue[900],
                    // elevation: 6.0,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.red,
                 ),
                    child: Text(
                      'START',
                      style: TextStyle(color: Constant.white, fontSize: 16),
                    ),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return NameScreen(screenHeight, screenWidth);
                        }),
                      );
                    },
                  )
                ],
              ),
            ),
          );
    
    }));

  }
}
