
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';

import '../units/constants.dart';

class RateReportScreen extends StatelessWidget {
  const RateReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextUnit(text: 'Rate Report',
          color: mainColor,
          size: 25,
          fontWeight: FontWeight.bold),
    );
  }
}
