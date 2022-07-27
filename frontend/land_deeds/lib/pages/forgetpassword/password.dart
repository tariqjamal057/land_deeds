import 'package:flutter/material.dart';
import 'package:land_deeds/pages/SignIn.dart';
import 'package:land_deeds/screens/forgotpassword/Passwordupdated.dart';

//assword visibility toggle
bool _passwordVisible1 = true;
bool _passwordVisible2 = true;
bool _isLoading = false;
bool _isDone = false;

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible1 = true;
    _passwordVisible2 = true;
    _isLoading = false;
    _isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: _isLoading
          ? Scaffold(
              body: Center(
                child: Column(
                  children: [
                    _isDone
                        ? PasswordUpdated()
                        : Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade700,
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            )
          : Scaffold(
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
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.mark_email_read,
                              color: Colors.blue.shade700,
                              size: 50,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "New Password",
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
                              "Your new password should not be same as previous password",
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
                                    obscureText: _passwordVisible1,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      letterSpacing: 1,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Password",
                                      hintText: "********",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      prefixIcon: Icon(Icons.lock),
                                      isDense: true,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible1 =
                                                !_passwordVisible1;
                                          });
                                        },
                                        icon: Icon(_passwordVisible1
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
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    obscureText: _passwordVisible2,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      letterSpacing: 1,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "New Password",
                                      hintText: "********",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      prefixIcon: Icon(Icons.lock),
                                      isDense: true,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible2 =
                                                !_passwordVisible2;
                                          });
                                        },
                                        icon: Icon(_passwordVisible2
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
                                    },
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        _isLoading = !_isLoading;
                                      });
                                      await Future.delayed(
                                        Duration(seconds: 3),
                                      );
                                      setState(() {
                                        _isDone = !_isDone;
                                      });
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
                                          "Confirm",
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontSize: 20,
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
                  ),
                ].reversed.toList(),
              ),
            ),
    );
  }
}
