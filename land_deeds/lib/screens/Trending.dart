import 'package:flutter/material.dart';

class TrendingLand extends StatefulWidget {
  const TrendingLand({Key? key}) : super(key: key);

  @override
  State<TrendingLand> createState() => _TrendingLandState();
}

class _TrendingLandState extends State<TrendingLand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Trending Lands"),
    );
  }
}