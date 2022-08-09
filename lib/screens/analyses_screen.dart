
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';

import '../units/constants.dart';

class AnalysesScreen extends StatelessWidget {
  const AnalysesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextUnit(text: 'Analyses',
          color: mainColor,
          size: 25,
          fontWeight: FontWeight.bold),
    );
  }
}
