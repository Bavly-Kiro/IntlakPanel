
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';

import '../units/constants.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextUnit(text: 'Sales',
          color: mainColor,
          size: 25,
          fontWeight: FontWeight.bold),
    );
  }
}
