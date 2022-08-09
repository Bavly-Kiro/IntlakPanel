
import 'package:intlakpanel/units/constants.dart';
import 'package:flutter/material.dart';

class TheFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final int mixLine;
  final String hintText;

  const TheFormFiled({Key? key, required this.controller, required this.mixLine, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        maxLines: mixLine,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Please Enter The date';
          }
          return null;
        },
        decoration:   InputDecoration(
            hintText: hintText,
            hintStyle:   const TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1
            )
          ),
            focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(
              color: mainColor,
              width: 1
          )
      )
        ),
      ),
    );
  }
}
