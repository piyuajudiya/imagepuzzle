import 'package:flutter/material.dart';
import 'package:imagepuzzle/game.dart';
import 'package:imagepuzzle/mainpage.dart';

class four extends StatefulWidget {
 int? p;
 four(this.p);
  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    double bodyheight = height - statusbar;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: bodyheight * 0.15,
                  padding: EdgeInsets.fromLTRB(80, 55, 0, 0),
                  child: Text(
                    "Puzzle ${widget.p!+1} compeleted",
                    style: TextStyle(fontSize: 25, color: Colors.indigo),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                    height: bodyheight * 0.30,
                    alignment: Alignment.center,
                    child: Image.asset("images/trophy.png"))
              ],
            ),
            Row(
              children: [
                InkWell(onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return t(widget.p!+1);
                  },));
                },
                  child: Container(
                      height: bodyheight * 0.08,
                      width: 150,
                      margin: EdgeInsets.fromLTRB(110, 10, 30, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                      child: Text(
                        "Continue",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return s();
                  },));
                },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(110, 10, 30, 0),
                      height: bodyheight * 0.08,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                      child: Text(
                        "Main Menu",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(110, 10, 30, 0),
                    height: bodyheight * 0.08,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.grey, Colors.white, Colors.grey]),
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                    child: Text(
                      "Buy Pro",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                  height: bodyheight * 0.10,
                  padding: EdgeInsets.fromLTRB(90, 10, 0, 0),
                  child: Text(
                    "Share This Puzzle",
                    style: TextStyle(fontSize: 25, color: Colors.indigo),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: bodyheight * 0.05,
                  margin: EdgeInsets.fromLTRB(170, 0, 30, 0),
                  padding: EdgeInsets.all(2),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
