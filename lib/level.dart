import 'package:flutter/material.dart';
import 'package:imagepuzzle/game.dart';
import 'package:imagepuzzle/mainpage.dart';
import 'package:imagepuzzle/win.dart';
import 'package:shared_preferences/shared_preferences.dart';

class f extends StatefulWidget {
  const f({Key? key}) : super(key: key);

  @override
  State<f> createState() => _fState();
}

class _fState extends State<f> {
  List images = List.filled(25, "images/lock.png");
  List statuslist = [];
  int lastlevel = 0;
  bool get = false;

  SharedPreferences? prefs;

  mypref() async {
    prefs = await SharedPreferences.getInstance();
      lastlevel = await prefs!.getInt('lastlevel') ?? 0;
    print("lastlevel=$lastlevel");
    for (int i = 0; i <= 24; i++) {
      String status = prefs!.getString("level$i") ?? "pending";
      setState(() {
        statuslist.add(status);
      });
      print("status of level$i=$status");
    }
    setState(() {
      get = true;
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
    double appbarheight = kToolbarHeight;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double bodyheight = height - statusbarheight;
    double margin = bodyheight / 100;

    return Scaffold(
      body: get?Column(
        children: [
          Container(
            height: height * 0.15,
            width: width,
            alignment: Alignment.center,
            child: Text(
              "Select puzzle",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, int index) {
                  if(statuslist[index]=="win")
                  {
                    return InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return t(index);
                      },));
                    },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/tick.png")
                            )
                        ),
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                      ),
                    );
                  }
                  else if(statuslist[index]=="skip")
                  {
                    return InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return t(index);
                      },));
                    },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                      ),
                    );
                  }
                  else if(statuslist[index]=="pending")
                  {
                    if(index==lastlevel+1 && prefs!.getInt('lastlevel')!=null){
                      return InkWell(onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          return t(index);
                        },));
                      },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("${index+1}"),
                        ),
                      );
                    }
                    else if(index==0){
                      return InkWell(onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          return t(index);
                        },));
                      },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("${index+1}"),
                        ),
                      );
                    }
                    else{
                      return Container(
                        child: Image.asset(images[index]),
                      );
                    }
                  }
                  else
                  {
                    return Container( );
                  }

                }),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * 0.1,
                width: width * 0.1,
                child: Image.asset('images/next.png'),
              ),
            ],
          )
        ],
      ):Container(),
    );
  }
}