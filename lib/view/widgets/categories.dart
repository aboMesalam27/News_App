import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:news/view/screens/categories_screen.dart';

class BuildRaisedButton extends StatelessWidget {
  //const BuildRaisedButton({Key? key}) : super(key: key);
  String textName;
  String textCaregory;
  Color colorButton;

  BuildRaisedButton(
      {required this.textName,
      required this.colorButton,
      required this.textCaregory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Categories("$textCaregory")));
        },
        child: Text(
          "$textName",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: Color.fromRGBO(25, 40, 47,1),
      ),
    );
  }
}
