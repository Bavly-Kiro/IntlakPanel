
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';

import '../units/constants.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextUnit(text: 'Exam',
          color: mainColor,
          size: 25,
          fontWeight: FontWeight.bold),
    );
  }
}
