import 'package:flutter/material.dart';
import 'package:imagepuzzle/win.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class t extends StatefulWidget {
  int? pos;

  t(this.pos);

  @override
  State<t> createState() => _tState();
}

class _tState extends State<t> {
  List<Widget> btn() {
    List<Widget> l = [];

    for (int i = 0; i < 10; i++) {
      l.add(
        Expanded(
          child: InkWell(
            onTap: () {
              print(i);
              setState(() {
                ans = ans + i.toString();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 45,
              margin: EdgeInsets.all(2),
              alignment: Alignment.center,
              child: Text(
                "${i}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }

    return l;
  }

  String ans = "";
  List answer = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];
int lastlevel = 0;
  SharedPreferences? prefs;

  mypref() async {
    prefs = await SharedPreferences.getInstance();
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
    double key = MediaQuery.of(context).viewInsets.bottom;
    double bodyheight = height - statusbar;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(onTap: () async {
                  await prefs!.setInt('lastlevel',widget.pos!);
                  await prefs!.setString("level${widget.pos}","skip");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return t(widget.pos!+1);
                  },));
                },
                  child: Container(
                    height: bodyheight * 0.10,
                    child: Image.asset("images/skip.png", width: width * 0.15),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: bodyheight * 0.08,
                    margin: EdgeInsets.fromLTRB(40, 20, 40, 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "images/level_board.png",
                            ),
                            fit: BoxFit.fill)),
                    child: Text(
                      "Puzzle ${widget.pos! + 1}",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "images/hint.png",
                    width: width * 0.15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: bodyheight * 0.60,
                    child: Image.asset(
                      "images/p${widget.pos! + 1}.png",
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              color: Colors.black,
              height: bodyheight * 0.17,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            ans,
                            style: TextStyle(fontSize: 25),
                          ),
                          margin: EdgeInsets.all(10),
                          height: bodyheight * 0.06,
                          width: width * 0.70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            ans = ans.substring(0, ans.length - 1);
                          });
                        },
                        child: Container(
                          height: bodyheight * 0.06,
                          width: width * 0.15,
                          child: Image.asset("images/delete.png"),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          print(ans);
                          print("rightans=${answer[widget.pos!]}");
                          if (ans == answer[widget.pos!]) {
                            await prefs!.setInt('lastlevel',widget.pos!);
                            await prefs!.setString("level${widget.pos}","win");
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return four(widget.pos);
                              },
                            ));
                          }
                        },
                          child: Container(
                            width: width * 0.15,
                            alignment: Alignment.center,
                            child: Text(
                              "submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),

                      )
                    ],
                  ),
                  Row(children: btn())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


