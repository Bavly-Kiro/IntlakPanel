
import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';



class DrawerPanel extends StatelessWidget {
   DrawerPanel({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: mainColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png',
              height: 200,
              width: 200),
          const SizedBox(height: 10),
          BuildListTileDrawer(
              icons: Icons.computer_rounded,
              name: 'Committees',
              fct: (){
              }),
          const SizedBox(height: 5),
          BuildListTileDrawer(
              icons: Icons.computer_rounded,
              name: 'Counter',
              fct: (){

              }),
          const SizedBox(height: 5),
          BuildListTileDrawer(
              icons: Icons.computer_rounded,
              name: 'news',
              fct: (){

              }),
          const SizedBox(height: 5),
          BuildListTileDrawer(
              icons: Icons.computer_rounded,
              name: 'Member',
              fct: (){

              }),
          const SizedBox(height: 5),

        ],
      ),
    );
  }
}
