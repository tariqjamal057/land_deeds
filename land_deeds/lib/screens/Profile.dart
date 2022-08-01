import 'package:flutter/material.dart';
import 'package:land_deeds/NetworkHandler.dart';
import 'package:land_deeds/models/profileModel.dart';
import 'package:land_deeds/pages/profile/EditProfile.dart';
import 'package:land_deeds/screens/profile/LandBuyed.dart';
import 'package:land_deeds/screens/profile/LandSeeled.dart';
import 'package:land_deeds/screens/profile/Lands.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentState = 0;
  List<Widget> widgets = [Lands(), LandsBuyed(), LandsSeeled()];

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
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "@",
              style: TextStyle(
                color: Colors.blue.shade700,
              ),
            ),
            Text(
              profileModel.username,
              style: TextStyle(
                color: Colors.blue.shade700,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileModel.username == ""
                      ? CircularProgressIndicator()
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkHandler().getImage(profileModel.username),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Lands",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Buyed",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Seeled",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(profileModel.firstname.toUpperCase()),
                  SizedBox(
                    width: 5,
                  ),
                  Text(profileModel.lastname.toUpperCase()),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Text(profileModel.city),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade700,
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentState = 0;
                      });
                    },
                    icon: Icon(Icons.real_estate_agent_outlined),
                    iconSize: 30,
                    color: Colors.blue.shade700,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentState = 1;
                      });
                    },
                    icon: Icon(Icons.landscape_rounded),
                    iconSize: 30,
                    color: Colors.blue.shade700,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentState = 2;
                      });
                    },
                    icon: Icon(Icons.sell_outlined),
                    iconSize: 30,
                    color: Colors.blue.shade700,
                  ),
                ],
              ),
              Divider(
                thickness: .3,
                color: Colors.grey,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.43,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: Scaffold(
                  backgroundColor: Colors.green,
                  body: Text("gffnxn"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
