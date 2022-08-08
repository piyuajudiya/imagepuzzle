import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class db extends StatefulWidget {
  const db({Key? key}) : super(key: key);

  @override
  State<db> createState() => _dbState();
}

class _dbState extends State<db> {
  TextEditingController t = TextEditingController();
  String str_db = "";
  SharedPreferences? prefs;

  mypref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      str_db = prefs!.getString('mytext')!;
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: t,
          ),
          ElevatedButton(
              onPressed: () async {
                await prefs!.setString('mytext', t.text);
                setState(() {
                 str_db= prefs!.getString('mytext')!;
                });
              },
              child: Text("submit")),
          Text("$str_db")
        ],
      ),
    );
  }
}
