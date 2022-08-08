import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class score extends StatefulWidget {
  const score({Key? key}) : super(key: key);

  @override
  State<score> createState() => _scoreState();
}

class _scoreState extends State<score> {
  int a = 0, b = 0, c = 0;
  int str_db = 0;
  int str_db1 = 0;
  SharedPreferences? prefs;

  mypref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      str_db = prefs!.getInt('mytext')!;
      str_db1 = prefs!.getInt('mystring')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mypref();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    double app = AppBar().preferredSize.height;
    double bodyheight = height - statusbar - app;
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: bodyheight * 0.05,
                  margin: EdgeInsets.all(10),
                  width: width * 0.20,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          a++;
                        });
                      },
                      child: Text("+",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                ),
                Container(
                  height: bodyheight * 0.10,
                  alignment: Alignment.center,
                  width: width * 0.45,
                  child: Text("${a}"),
                ),
                Container(
                  height: bodyheight * 0.05,
                  margin: EdgeInsets.all(10),
                  width: width * 0.20,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          a--;
                        });
                      },
                      child: Text("-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: bodyheight * 0.05,
                  width: width * 0.35,
                  margin: EdgeInsets.fromLTRB(110, 0, 80, 0),
                  child: ElevatedButton(
                      onPressed: () async {
                        str_db = prefs!.getInt('mytext')!;
                        str_db1 = prefs!.getInt('mystring')!;

                        if (a >  str_db) {

                          await prefs!.setInt('mytext', b);
// a = b;
                        }
                        if (a <  str_db) {
                          await prefs!.setInt('mytext', c);
                        }
                        await prefs!.setInt('mytext', b);
                        await prefs!.setInt('mystring', c);

                      },
                      child: Text("SUBMIT")),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: bodyheight * 0.10,
                  alignment: Alignment.center,
                  child: Text("High Score = $str_db",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Low Score = $str_db1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
// if (a >  str_db) {
// str_db1 =  str_db;
// str_db = a;
// print("high=$ str_db");
// print("low=$ str_db1");
// // a = b;
// }
// if (a <  str_db) {
// str_db1 = a;
// print("high=$ str_db");
// print("low=$ str_db1");
// }

// if (a > b) {
// c = b;
// b = a;
// print("high=$b");
// print("low=$c");
// // a = b;
// }
// if (a < b) {
// c = a;
// print("high=$b");
// print("low=$c");
// }
