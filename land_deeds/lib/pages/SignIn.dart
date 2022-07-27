import 'package:flutter/material.dart';
import 'package:land_deeds/pages/Welcome.dart';

import 'forgetpassword/ForgetPassword.dart';

//assword visibility toggle
bool _passwordVisible = true;

//validating the email address
const String email =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<Offset> animation1;
  late AnimationController _controller21;
  late Animation<Offset> animation21;
  late AnimationController _controller22;
  late Animation<Offset> animation22;
  late AnimationController _controller3;
  late Animation<Offset> animation3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;

    //animation 1
    _controller1 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 4.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeOut),
    );

    //animation 21
    _controller21 = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    animation21 = Tween<Offset>(
      begin: Offset(0.0, 4.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller21, curve: Curves.easeOut),
    );

    //animation 22
    _controller22 = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    animation22 = Tween<Offset>(
      begin: Offset(0.0, 4.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller22, curve: Curves.easeOut),
    );

    //animation 3
    _controller3 = AnimationController(
      duration: Duration(milliseconds: 2100),
      vsync: this,
    );
    animation3 = Tween<Offset>(
      begin: Offset(0.0, 4.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeOut),
    );

    _controller1.forward();
    _controller21.forward();
    _controller22.forward();
    _controller3.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
    _controller21.dispose();
    _controller22.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          elevation: 0,
          title: Text("khn"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          reverse: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Padding(
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
                      height: 20,
                    ),
                    SlideTransition(
                      position: animation1,
                      child: Text(
                        "Welcome Back! Login with your credentials",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Form(
                      child: Column(
                        children: [
                          SlideTransition(
                            position: animation21,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 1,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email Address",
                                hintText: "enter your email address",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                prefixIcon: Icon(Icons.email),
                                isDense: true,
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                RegExp regexp = new RegExp(email);
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Email Address";
                                } else if (!regexp.hasMatch(value)) {
                                  return "Please Enter Valid Email Address";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SlideTransition(
                            position: animation22,
                            child: TextFormField(
                                obscureText: _passwordVisible,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  letterSpacing: 1,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Password",
                                  hintText: "enter your password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  prefixIcon: Icon(Icons.lock),
                                  isDense: true,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(_passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.length > 8) {
                                    return "Password Should be greter than 8 Characters";
                                  }
                                }),
                          ),
                          SizedBox(height: 10),
                          SlideTransition(
                            position: animation3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPassword()));
                                  },
                                  child: Text("Forgot Password?",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        letterSpacing: .7,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SlideTransition(
                            position: animation3,
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                ),
                                child: Text("Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      letterSpacing: 1.2,
                                      color: Colors.white,
                                    )),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
