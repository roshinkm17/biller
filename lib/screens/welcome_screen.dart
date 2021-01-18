import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:biller/components/mainButton.dart';
import 'package:biller/screens/registration_screen_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen_id";
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfLoggedIn();
  }
  void checkIfLoggedIn() async{
    var token = await Backendless.userService.getUserToken();
    if(token != null && token.isNotEmpty){
      //User already logged in
      print("User found!");
      var isValid = await Backendless.userService.isValidLogin();
      if(isValid){
        String currentUserObjectId = await Backendless.userService.loggedInUser();
        var user = await  Backendless.data.of("Users").findById(currentUserObjectId);
        Navigator.of(context).pushReplacementNamed(HomeScreen.id);
      }
    }
    else{
      print("No user found!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Biller",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            Column(
              children: [
                MainButton(
                  buttonText: "Log in",
                  onPressed: () {
                    print("Log in");
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                SizedBox(height: 20),
                MainButton(
                  buttonText: "Sign up",
                  onPressed:(){
                    print("Sign up");
                    Navigator.pushNamed(context, RegistrationScreenOne.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
