import 'package:flutter/material.dart';
import '../constants.dart';


class MainButton extends StatelessWidget {
  MainButton({this.buttonText});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        color: buttonColor,
        onPressed: (){
          print("pressed");
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
