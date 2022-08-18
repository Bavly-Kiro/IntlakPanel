
import 'package:intlakpanel/screens/analyses_screen.dart';
import 'package:intlakpanel/screens/assignteacher_screen.dart';
import 'package:intlakpanel/screens/details_school_screen.dart';
import 'package:intlakpanel/screens/exam_screen.dart';
import 'package:intlakpanel/screens/teacher_screen.dart';
import 'package:intlakpanel/screens/rate_report_screen.dart';
import 'package:intlakpanel/screens/sales_screen.dart';
import 'package:intlakpanel/screens/subject_screen.dart';
import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/drawer_panel.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';
class HomePanelScreen extends StatefulWidget {
    const HomePanelScreen({Key? key}) : super(key: key);

  @override
  State<HomePanelScreen> createState() => _HomePanelScreenState();
}
class _HomePanelScreenState extends State<HomePanelScreen> {
    bool isDetailsScreen=true;
    bool isTeacher=false;
    bool isRateReport=false;
    bool iSales=false;
    bool isExam=false;
    bool isAnalyses=false;
    bool isSubject=false;
    bool isAssignAndTeacher=false;

    void changeDetailsScreen(){
      setState(() {
        isDetailsScreen=true;
        isTeacher=false;
         isRateReport=false;
         iSales=false;
         isExam=false;
         isAnalyses=false;
         isSubject=false;
         isAssignAndTeacher=false;
      });

    }

    void changeTeacher(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=true;
        isRateReport=false;
        iSales=false;
        isExam=false;
        isAnalyses=false;
        isSubject=false;
        isAssignAndTeacher=false;
      });
    }

    void changeRateReport(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=false;
        isRateReport=true;
        iSales=false;
        isExam=false;
        isAnalyses=false;
        isSubject=false;
        isAssignAndTeacher=false;
      });
    }
    void changeSales(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=false;
        isRateReport=false;
        iSales=true;
        isExam=false;
        isAnalyses=false;
        isSubject=false;
        isAssignAndTeacher=false;
      });
    }
    void changeExam(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=false;
        isRateReport=false;
        iSales=false;
        isExam=true;
        isAnalyses=false;
        isSubject=false;
        isAssignAndTeacher=false;
      });
    }
    void changeAnalyses(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=false;
        isRateReport=false;
        iSales=false;
        isExam=false;
        isAnalyses=true;
        isSubject=false;
        isAssignAndTeacher=false;
      });
    }
    void changeSubject(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=false;
        isRateReport=false;
        iSales=false;
        isExam=false;
        isAnalyses=false;
        isSubject=true;
        isAssignAndTeacher=false;
      });
    }
    void changeAssignAndTeacher(){
      setState(() {
        isDetailsScreen=false;
        isTeacher=false;
        isRateReport=false;
        iSales=false;
        isExam=false;
        isAnalyses=false;
        isSubject=false;
        isAssignAndTeacher=true;
      });
    }



  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: mainColor,
        elevation: 0.0,
        title: TextUnit(
           text: ' Panel',
          color: mainColor,
          size: size.width>500?30:20,
          fontWeight: FontWeight.bold,
        ),

      ),
      body: Row(
        children: [
          size.width>500?Container(
            width: 200,
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: changeDetailsScreen,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Details School',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),

                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeTeacher,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Teacher',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeRateReport,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Rate Report ',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeSales,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Sales',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeExam,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Exams',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeAnalyses,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Analyses',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeSubject,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Subject',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: changeAssignAndTeacher,
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Assign Teacher',
                      size: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){},
                    child: TextUnit(
                      color: Colors.white,
                      text: 'Log Out',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )),

              ],
            ),
          ):Container(),
          Expanded(
            child:
            isDetailsScreen?const DetailsSchoolScreen():
            isTeacher? TeacherScreen():
            isRateReport? const  RateReportScreen():
            iSales? const  SalesScreen():
            isExam?   Container():
            isAnalyses? const  AnalysesScreen():
            isSubject? const  MainSubjectScreen():
            isAssignAndTeacher? const  AssignAndTeacherScreen():
            Container(),
          ),
        ],
      )
    );
  }
}
