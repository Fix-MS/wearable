import 'dart:convert';
import 'dart:io';
  import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_wear_os/utils.dart';
import 'package:new_wear_os/wear.dart';
import 'package:new_wear_os/colors.dart';


class ErrorScreen extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  final id;
  ErrorScreen(this.screenHeight, this.screenWidth, this.id);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode) => ErrorScreenUI(screenHeight, screenWidth, id),
      // builder: (context, mode) => mode == Mode.active
      //     ? FinishScreenUI(screenHeight, screenWidth)
      //     : AmbientWatchFace(),
    );
  }
}

class ErrorScreenUI extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  final id;
  ErrorScreenUI(this.screenHeight, this.screenWidth, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.red,
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/outline_arrow.png',
                      scale: 1.8,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Zurück',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white,),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 15),
              Text(
                '[Error]',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              
              SizedBox(height: 5),
              Text(
                this.id,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              
            ],
          ),
        ),
      ),
    );
  }
}
