import 'package:flutter/material.dart';

import '../../pages/SignIn.dart';

class PasswordUpdated extends StatefulWidget {
  const PasswordUpdated({Key? key}) : super(key: key);

  @override
  State<PasswordUpdated> createState() => _PasswordUpdatedState();
}

class _PasswordUpdatedState extends State<PasswordUpdated> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Text(
            "Password Updated",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue.shade700,
              letterSpacing: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Center(
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Youe password updated successfully",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius
                ),
              ),
              child: Text("Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  )),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
