import 'package:flutter/material.dart';

class SavedLands extends StatefulWidget {
  const SavedLands({Key? key}) : super(key: key);

  @override
  State<SavedLands> createState() => _SavedLandsState();
}

class _SavedLandsState extends State<SavedLands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Saved Lands"),
    );
  }
}
