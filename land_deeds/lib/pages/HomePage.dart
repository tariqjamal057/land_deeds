import 'package:flutter/material.dart';
import 'package:land_deeds/models/profileModel.dart';
import 'package:land_deeds/pages/profile/ProfilePage.dart';
import 'package:land_deeds/screens/Home.dart';
import 'package:land_deeds/screens/Profile.dart';
import 'package:land_deeds/screens/SavedLands.dart';
import 'package:land_deeds/screens/Trending.dart';

import '../NetworkHandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentState = 0;
  List<Widget> widgets = [Home(), TrendingLand(), SavedLands(), Profile()];

  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await networkHandler.get("/user/getData");
    print(response);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue.shade700,
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //     size: 30,
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade700,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: currentState == 0
                      ? Icon(Icons.home)
                      : Icon(Icons.home_outlined),
                  onPressed: () {
                    setState(() {
                      currentState = 0;
                    });
                  },
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  icon: currentState == 1
                      ? Icon(Icons.trending_up_rounded)
                      : Icon(Icons.trending_up_sharp),
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                    });
                  },
                  iconSize: 40,
                  color: Colors.white,
                ),
                IconButton(
                  icon: currentState == 2
                      ? Icon(Icons.turned_in_rounded)
                      : Icon(Icons.turned_in_not_rounded),
                  onPressed: () {
                    setState(() {
                      currentState = 2;
                    });
                  },
                  iconSize: 30,
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentState = 3;
                    });
                  },
                  child: profileModel.username == ""
                      ? Icon(
                          Icons.person,
                          size: 30,
                        )
                      : CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              NetworkHandler().getImage(profileModel.username),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: widgets[currentState],
    );
  }
}
