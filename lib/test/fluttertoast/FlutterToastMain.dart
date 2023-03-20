import 'package:flutter/material.dart';
import 'package:xinshijieapp/test/fluttertoast/ToastContext.dart';
import 'package:xinshijieapp/test/fluttertoast/ToastNoContext.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class FlutterToastMain extends StatefulWidget {
  @override
  _FlutterToastMainState createState() => _FlutterToastMainState();
}

class _FlutterToastMainState extends State<FlutterToastMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ToastNoContext(),
              ));
            },
            child: Text("Flutter Toast No Context"),
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ToastContext(),
              ));
            },
            child: Text("Flutter Toast Context"),
          ),
        ],
      ),
    );
  }
}