import 'package:flutter/material.dart';
import 'package:land_deeds/pages/SignIn.dart';
import 'package:land_deeds/pages/forgetpassword/codeverify.dart';

//validating the email address
const String email =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          reverse: true,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    Icon(
                      Icons.lock_clock_outlined,
                      color: Colors.blue[700],
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forget Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please enter your email address to recieve verfication code",
                      style: TextStyle(
                        color: Colors.black,
                        height: 1.4,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: true,
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
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CodeVerify()));
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[700],
                              ),
                              child: Center(
                                child: Text(
                                  "Send Code",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
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
