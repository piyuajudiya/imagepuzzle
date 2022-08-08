import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class twopage extends StatefulWidget {
  const twopage({Key? key}) : super(key: key);

  @override
  State<twopage> createState() => _twopageState();
}

class _twopageState extends State<twopage> {
  List rnum = List.empty(growable: true);
  List rnum1 = List.empty(growable: true);
  List colorlist = List.filled(16, false);

  List main = [];

  first() {
    for (int i = 0; i < 8;) {
      int a = Random().nextInt(100);
      if (!rnum.contains(a)) {
        rnum.add(a);
        i++;
      }
    }
  }

  second() {
    for (int i = 0; i < 8;) {
      int a = Random().nextInt(100);
      if (!rnum1.contains(a)) {
        rnum1.add(a);
        i++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    first();
    second();
    third();
  }

  third() {
    main = rnum + rnum1;
    print(main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: (2 / 1),
            ),
            itemBuilder: (context, index) {
              return Container(
                color: colorlist[index] ? Colors.green : Colors.blue,
                alignment: Alignment.center,
                child: Text("${main[index]}"),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              int random = Random().nextInt(16);
              int random_number = main[random];
              print(random_number);
              for (int i = 0; i < main.length; i++) {
                if (main[i] == random_number) {
                  setState(() {
                    colorlist[i] = true;
                  });
                  print("pos=$i");
                }
              }
            },
            child: Text("Submit"),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              int random = Random().nextInt(16);
              int random_number = main[random];
              print(random_number);
              for (int i = 0; i < main.length; i++) {
                if (main[i] == random_number) {
                  setState(() {
                    colorlist[i] = true;
                  });
                  print("pos=$i");
                }
              }
            },
            child: Text("Submit"),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: (2 / 1),
            ),
            itemBuilder: (context, index) {
              return Container(
                color: colorlist[index + 8] ? Colors.green : Colors.blue,
                alignment: Alignment.center,
                child: Text("${main[index + 8]}"),
              );
            },
          )
        ],
      ),
    );
  }
}
