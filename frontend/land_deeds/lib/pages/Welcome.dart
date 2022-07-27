import 'package:flutter/material.dart';
import 'package:land_deeds/pages/Register.dart';
import 'package:land_deeds/pages/SignIn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<Offset> animation1;
  late AnimationController _controller21;
  late Animation<Offset> animation21;
  late AnimationController _controller22;
  late Animation<Offset> animation22;
  late AnimationController _controller23;
  late Animation<Offset> animation23;
  late AnimationController _controller3;
  late Animation<Offset> animation3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //animation 1
    _controller1 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeOut),
    );

    // animation 2.1
    _controller21 = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    animation21 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller21, curve: Curves.elasticInOut),
    );
    // animation 2.2
    _controller22 = AnimationController(
      duration: Duration(milliseconds: 2200),
      vsync: this,
    );
    animation22 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller22, curve: Curves.elasticInOut),
    );
    // animation 2.3
    _controller23 = AnimationController(
      duration: Duration(milliseconds: 2400),
      vsync: this,
    );
    animation23 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller23, curve: Curves.elasticInOut),
    );
    // animation 3
    _controller3 = AnimationController(
      duration: Duration(milliseconds: 2400),
      vsync: this,
    );
    animation3 = Tween<Offset>(
      begin: Offset(8.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeOut),
    );

    _controller1.forward();
    _controller21.forward();
    _controller22.forward();
    _controller23.forward();
    _controller3.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
    _controller21.dispose();
    _controller22.dispose();
    _controller23.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: animation1,
                child: Icon(
                  Icons.home,
                  color: Colors.blue[700],
                  size: 70,
                ),
              ),
              SlideTransition(
                position: animation1,
                child: Text(
                  "Land Deeds",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SlideTransition(
                position: animation1,
                child: Text("Hello there!",
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    )),
              ),
              SizedBox(
                height: 80,
              ),
              SlideTransition(
                position: animation21,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/google.png",
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Sign in with Google",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SlideTransition(
                position: animation22,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/facebook1.png",
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Sign in with Facebook",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SlideTransition(
                position: animation23,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/email2.png",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Sign in with Email",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
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
                  SizedBox(),
                  Container(
                    child: SlideTransition(
                      position: animation3,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => RegisterPage())));
                              },
                              child: Text(
                                "register",
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
