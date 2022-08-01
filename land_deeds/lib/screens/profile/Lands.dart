import 'package:flutter/material.dart';

class Lands extends StatefulWidget {
  const Lands({Key? key}) : super(key: key);

  @override
  State<Lands> createState() => _LandsState();
}

class _LandsState extends State<Lands> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Text("Lands"),
      ),
    );
  }
}
