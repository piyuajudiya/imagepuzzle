import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imagepuzzle/level.dart';
import 'package:imagepuzzle/game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class s extends StatefulWidget {
  const s({Key? key}) : super(key: key);

  @override
  State<s> createState() => _sState();
}

class _sState extends State<s> {
  int lastlevel = 0;
  SharedPreferences? prefs;

  mypref() async {
    prefs = await SharedPreferences.getInstance();
    lastlevel = await prefs!.getInt('lastlevel') ?? 0;
    print("lastlevel=$lastlevel");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mypref();
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    double bodyheight = height - statusbar;
    return Scaffold(
      body: Container(
        //height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: bodyheight * 0.15,
              margin: EdgeInsets.fromLTRB(0, 50, 0, 15),
              alignment: Alignment.center,
              child: Text(
                "Math Puzzles",
                style: TextStyle(fontSize: 35, color: Colors.indigo),
              ),
            ),
            Expanded(
                child: Container(
              height: bodyheight * 0.70,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/blackboard_main_menu.png"),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          if (prefs != null) {
                            return t(lastlevel);
                          } else {
                            return t(0);
                          }
                        },
                      ));
                    },
                    child: Container(
                      height: 50,
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return f();
                        },
                      ));
                    },
                    child: Container(
                      height: 50,
                      child: Text(
                        "Puzzles",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Text(
                      "Buy Pro",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  )
                ],
              ),
            )),
            Row(
              children: [
                Container(
                  height: bodyheight * 0.15,
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 30),
                  child: Image.asset(
                    "images/ltlicon.png",
                    height: 70,
                    width: 70,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                  padding: EdgeInsets.all(2),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.grey, Colors.white, Colors.grey]),
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Image.asset("images/shareus.png"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                  padding: EdgeInsets.all(2),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.grey, Colors.white, Colors.grey]),
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Image.asset("images/emailus.png"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
