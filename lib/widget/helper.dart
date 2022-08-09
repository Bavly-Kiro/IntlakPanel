


import 'package:intlakpanel/units/constants.dart';
import 'package:flutter/material.dart';

class TextUnit extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  TextAlign? textAlign;
  final int? mixLine;
  final TextOverflow? textOverflow;

  TextUnit({Key? key, required this.text, required this.color, required this.size, required this.fontWeight,
  this.textAlign, this.mixLine, this.textOverflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: textAlign??TextAlign.start,
    maxLines: mixLine,
    overflow: textOverflow??TextOverflow.visible,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      wordSpacing: 2
    ),);
  }
}

class BuildListTileDrawer extends StatelessWidget {
  final String name;
  final Function() fct;
  final IconData icons;
  const BuildListTileDrawer({Key? key, required this.name, required this.fct, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: fct,
      title: TextUnit(
        text: name,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        size:20,
      ),
      leading: Icon(icons,
      size: 25,
      color: Colors.white),
    );
  }
}


Future<void> dialogDelete({BuildContext? context,required Function() fct})async{
  return await showDialog(
      context: context!,
      builder: (context){
        return AlertDialog(
          title: TextUnit(
            text: 'Delete',
            fontWeight: FontWeight.bold,
            size: 25,
            color: mainColor,
          ),
          elevation: 10,
          content: TextUnit(
            text: 'Im Sure Delete Item',
            fontWeight: FontWeight.normal,
            size: 20,
            color: Colors.black,
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: TextUnit(
                  color: mainColor,
                  size: 20,
                  fontWeight: FontWeight.normal,
                  text: 'Cancel',
                )),
            TextButton(onPressed: fct,
                child: TextUnit(
                  color: Colors.red,
                  size: 20,
                  fontWeight: FontWeight.normal,
                  text: 'Ok',
                )),
          ],
        );
      });
}



Future<void> dialogEdit({BuildContext? context,required Function() fct,
required Widget widget})async{
  return await showDialog(
      context: context!,
      builder: (context){
        return AlertDialog(
          title: TextUnit(
            text: 'Edit',
            fontWeight: FontWeight.bold,
            size: 25,
            color: mainColor,
          ),
          elevation: 10,
          content: widget,
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: TextUnit(
                  color: mainColor,
                  size: 20,
                  fontWeight: FontWeight.normal,
                  text: 'Cancel',
                )),
            TextButton(onPressed: fct,
                child: TextUnit(
                  color: Colors.red,
                  size: 20,
                  fontWeight: FontWeight.normal,
                  text: 'Ok',
                )),
          ],
        );
      });
}







