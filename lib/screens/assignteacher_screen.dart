
import 'package:intlakpanel/widget/buttons.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:intlakpanel/widget/selected_textform.dart';

import '../units/constants.dart';
class AssignAndTeacherScreen extends StatefulWidget {
  const AssignAndTeacherScreen({Key? key}) : super(key: key);

  @override
  State<AssignAndTeacherScreen> createState() => _AssignAndTeacherScreenState();
}
class _AssignAndTeacherScreenState extends State<AssignAndTeacherScreen> {

  late final TextEditingController subjectController=TextEditingController(text: '');
  late final TextEditingController teacherController=TextEditingController(text: '');
  late final TextEditingController typeSchoolController=TextEditingController(text: '');

  late final TextEditingController editSubjectController=TextEditingController(text: '');
  late final TextEditingController editTeacherController=TextEditingController(text: '');
  late final TextEditingController editTypeSchoolController=TextEditingController(text: '');
  var formKey=GlobalKey<FormState>();
  var editFormKey=GlobalKey<FormState>();
  bool isAdd=true;

  bool isShow=false;

  void changeAdd(){
    setState(() {
      isAdd=true;
      isShow=false;
    });

  }

  void changeEdit(){
    setState(() {
      isAdd=false;
      isShow=true;
    });
  }



  String value = '';

  List<String> subject=['subject1','subject2','subject3'];
  List<String> teacher=['teacher1','teacher2','teacher3'];
  List<String> typeSchool=['typeSchool1','typeSchool2','typeSchool3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Assign Teacher',
              color: mainColor,
              size: 25,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: changeAdd,
                child:const  Text('Add'),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: changeEdit,
                child:const  Text('Show'),
              ),
            ],
          ),
        ),
        Expanded(child:
        Padding(
            padding: const EdgeInsets.all(30),
            child:
            isAdd? Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SelectedFormFiled(
                      hintText:'Subject' ,
                      controller:subjectController ,
                      list: [ ...subject.map((e){
                        return DropdownMenuItem(
                          value: e,
                          onTap: (){
                            setState(() {
                              value=e;
                              subjectController.text=e;
                            });
                          },
                          child:   Text(e),
                        );
                      })],
                    ),
                    SelectedFormFiled(
                      hintText:'Teacher' ,
                      controller:teacherController ,
                      list: [ ...teacher.map((e){
                        return DropdownMenuItem(
                          value: e,
                          onTap: (){
                            setState(() {
                              value=e;
                              teacherController.text=e;
                            });
                          },
                          child:   Text(e),
                        );
                      })],
                    ),
                    SelectedFormFiled(
                      hintText:'Type School' ,
                      controller:typeSchoolController ,
                      list: [ ...typeSchool.map((e){
                        return DropdownMenuItem(
                          value: e,
                          onTap: (){
                            setState(() {
                              value=e;
                              typeSchoolController.text=e;
                            });
                          },
                          child:   Text(e),
                        );
                      })],
                    ),
                    const SizedBox(height: 10,),
                    MaButton(name: 'Update',
                        fct: (){},
                        size: 20),
                  ],
                ),
              ),
            ) :
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder:(context,index){
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white38,
                      border: Border.all(
                          color: Colors.black,
                          width: 2
                      ),
                    ),
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(text: 'Subject Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Subject ar',style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                    ),
                                  ]
                              ),
                            ),
                            RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(text: 'Subject En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Subject en',style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(text: 'Teacher Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Teacher ar',style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                    ),
                                  ]
                              ),
                            ),
                            RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(text: 'Teacher En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Teacher en',style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(text: 'TypeSchool Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'TypeSchool ar',style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                    ),
                                  ]
                              ),
                            ),
                            RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(text: 'TypeSchool En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'TypeSchool en',style:  TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: (){
                                  dialogEdit(context:context ,fct: (){},
                                      widget:SizedBox(
                                        width: 500,
                                        child: Form(
                                          key: editFormKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SelectedFormFiled(
                                                hintText:'Subject' ,
                                                controller:editSubjectController ,
                                                list: [ ...subject.map((e){
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    onTap: (){
                                                      setState(() {
                                                        value=e;
                                                        editSubjectController.text=e;
                                                      });
                                                    },
                                                    child:   Text(e),
                                                  );
                                                })],
                                              ),
                                              SelectedFormFiled(
                                                hintText:'Teacher' ,
                                                controller:editTeacherController ,
                                                list: [ ...teacher.map((e){
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    onTap: (){
                                                      setState(() {
                                                        value=e;
                                                        editTeacherController.text=e;
                                                      });
                                                    },
                                                    child:   Text(e),
                                                  );
                                                })],
                                              ),
                                              SelectedFormFiled(
                                                hintText:'TypeSchool' ,
                                                controller:editTypeSchoolController ,
                                                list: [ ...typeSchool.map((e){
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    onTap: (){
                                                      setState(() {
                                                        value=e;
                                                        editTypeSchoolController.text=e;
                                                      });
                                                    },
                                                    child:   Text(e),
                                                  );
                                                })],
                                              ),




                                            ],
                                          ),
                                        ),
                                      ) );


                                },
                                child:const  Text('Edit'),
                              ),
                            ),),
                            Expanded(child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: (){
                                  dialogDelete(context: context,fct: (){});
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                ),
                                child:const  Text('Delete'),
                              ),
                            ),),
                          ],
                        ),
                      ],
                    ),
                  );
                } )
        ),)
      ],
    );
  }
}
