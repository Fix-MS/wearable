import 'dart:convert';
import 'dart:io';
  import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_wear_os/utils.dart';
import 'package:new_wear_os/wear.dart';
import 'package:new_wear_os/colors.dart';
import 'package:new_wear_os/screens/finish_screen.dart';
import 'package:new_wear_os/screens/error_screen.dart';


class NameScreen extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  NameScreen(this.screenHeight, this.screenWidth);

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

class NameScreenUI extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  NameScreenUI(this.screenHeight, this.screenWidth);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // Image.asset(
                    //   'assets/outline_arrow.png',
                    //   scale: 1.8,
                    // ),
                    // SizedBox(width: 5),
                    // Text(
                    //   'Back',
                    //   style:
                    //       TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    // )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 15),
              Text(
                'Wartehalle verschmutzt\n',
                style: TextStyle(
                  color: HexColor('#DA121A'),
                  fontSize: 10,
                ),
              ),
              Text(
                '"Westfalenstraße 197,\n 48165 Münster"',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 5),
              SizedBox(height: 5),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:HexColor('#DA121A'),
              ),
              child: Text(
                'Position melden!',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              onPressed: () async {
                DateTime now = new DateTime.now();
                DateTime date = new DateTime(now.year, now.month, now.day);
                String remark = "das sit ein test um " + date.toString().replaceAll("00:00:00.000", "");
                var data = {
                  'type': 124,
                  'location': "Westfalenstraße 197, 48165 Münster",
                  'firstname': "Robert",
                  'lastname': "Willemelis",
                  'email': "r.wille3055@gmx.de",
                  'remark': remark,
                  'final': false
                };
                final body = jsonEncode(data);
                try{
                  final client = HttpClient();
                  // final request = await client.postUrl(Uri.parse("https://172.16.2.89:9000/api/reports"));
                  final request = await client.postUrl(Uri.parse("https://fixms.webfoo.de/api/reports"));
                  request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
                  request.write(body);
                  final response = await request.close()
                  .timeout(const Duration(seconds: 5));


                  response.transform(utf8.decoder).listen((contents) {
                    print(contents);
                    var id =contents.replaceAll('{"id":', '').replaceAll('}', '') ;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return FinishScreen(screenHeight, screenWidth, id);
                      }),
                    );
                  });
} catch(e){
Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ErrorScreen(screenHeight, screenWidth, e.toString());
                      }),
                    );
}

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
