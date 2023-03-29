import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xinshijieapp/test/diolog/alert_page.dart';
import 'package:xinshijieapp/test/diolog/diolog1.dart';

class DiologMain extends StatefulWidget {
  const DiologMain({Key? key}) : super(key: key);

  @override
  State<DiologMain> createState() => _DiologMainState();
}

class _DiologMainState extends State<DiologMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("diolog"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  AlertPage(),
              ));
            },
            child: Text("普通弹出框"),
          ),
          // SizedBox(
          //   height: 24.0,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => ToastContext(),
          //     ));
          //   },
          //   child: Text("Flutter Toast Context"),
          // ),
        ],
      ),
    );
  }
}
