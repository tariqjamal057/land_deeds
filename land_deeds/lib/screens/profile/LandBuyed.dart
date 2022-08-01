import 'package:flutter/material.dart';

class LandsBuyed extends StatefulWidget {
  const LandsBuyed({Key? key}) : super(key: key);

  @override
  State<LandsBuyed> createState() => _LandsBuyedState();
}

class _LandsBuyedState extends State<LandsBuyed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Lands Buyed"),
    );
  }
}
