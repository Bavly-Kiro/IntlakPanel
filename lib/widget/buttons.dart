
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../units/constants.dart';
import 'helper.dart';


class MaButton extends StatelessWidget {
  final String name;
  final Function() fct;
  final double size;
  const MaButton({Key? key, required this.name, required this.fct, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: fct,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: mainColor,
      child:  Padding(
        padding:  const EdgeInsets.all( 5.0,),
        child:  TextUnit(
          text: name,
          color: Colors.white,
          size: size,
          fontWeight: FontWeight.bold,
        ),
      ),);
  }
}



