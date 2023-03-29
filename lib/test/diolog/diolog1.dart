import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Diolog1 extends StatefulWidget {
  const Diolog1({Key? key}) : super(key: key);

  @override
  State<Diolog1> createState() => _Diolog1State();
}

class _Diolog1State extends State<Diolog1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Expanded(
        child: Text("test1") ,
      ),
    );
  }
}
