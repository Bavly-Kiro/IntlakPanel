
import 'dart:io';
import 'dart:typed_data';

import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/buttons.dart';
import '../widget/form_filed.dart';
import '../widget/show_date_teacher.dart';

class TeacherScreen extends StatefulWidget {
  TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  bool isAdd=false;
  bool isEdit=true;
  void changeAddCommittees(){
    setState(() {
      isAdd=true;
      isEdit=false;
    });

  }

  void changeEditCommittees(){
    setState(() {
      isAdd=false;
      isEdit=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Professor',
              color: mainColor,
              size: 25,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                ElevatedButton(
                  onPressed: ()=>changeAddCommittees(),
                  child:const  Text('Add'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: ()=>changeEditCommittees(),
                  child:const  Text('Date And Edit'),
                ),


              ],
            ),
          ),
        ),
        Expanded(child:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: isAdd?
            const AddTeacher():const EditProfessor(),
          ),
        ),)
      ],
    );
  }
}

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  late final TextEditingController nameArController=TextEditingController(text: '');

  late final TextEditingController nameEnController=TextEditingController(text: '');

  late final TextEditingController emailController=TextEditingController(text: '');

  late final TextEditingController phoneNumberController=TextEditingController(text: '');

  late final TextEditingController detailsArController=TextEditingController(text: '');

  late final TextEditingController detailsEnController=TextEditingController(text: '');

  late final TextEditingController classRoomArController=TextEditingController(text: '');

  late final TextEditingController classRoomEnController=TextEditingController(text: '');

  var committeesKey=GlobalKey<FormState>();
  File? imagePiked;
  Uint8List imageWeb=Uint8List(8);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: committeesKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 300,
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.black)
               ),
              child: Center(
                child: TextButton(
                    onPressed: ()async{
                  if(!kIsWeb){
                    final ImagePicker picker=ImagePicker();
                    XFile? image=await picker.pickImage(source: ImageSource.gallery);
                    if(image !=null){
                      var selected=File(image.path);
                      setState(() {
                        imagePiked=selected;
                      });
                    }}
                  else if(kIsWeb){
                    final ImagePicker picker=ImagePicker();
                    XFile? image=await picker.pickImage(source: ImageSource.gallery);
                    if(image !=null){
                      var f=await image.readAsBytes();
                      setState(() {
                        imageWeb=f;
                        imagePiked=File('a');
                      });
                    }

                  }
                },
                child: imagePiked==null?TextUnit(
                  text: 'Choose Image',
                  fontWeight: FontWeight.normal,
                  size: 20,
                  color: mainColor,
                ):(kIsWeb)?Image.memory(imageWeb):Image.file(imagePiked!)),
              ),
            ),
            TextUnit(text:'Name' ,
                color: Colors.black,
                size: 20,
                fontWeight: FontWeight.bold),
            Row(
              children: [
                Expanded(
                  child: TheFormFiled(
                    controller:nameArController,
                    hintText: 'name Ar',
                    mixLine: 1,
                  ),
                ),
                Expanded(
                  child: TheFormFiled(
                    controller:nameEnController,
                    hintText: 'Name En',
                    mixLine: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            TextUnit(text:'Email' ,
                color: Colors.black,
                size: 20,
                fontWeight: FontWeight.bold),
            TheFormFiled(
              controller:emailController,
              hintText: 'Email',
              mixLine: 1,
            ),
            const SizedBox(height: 10,),
            TextUnit(text:'Phone Number' ,
                color: Colors.black,
                size: 20,
                fontWeight: FontWeight.bold),
            TheFormFiled(
              controller:phoneNumberController,
              hintText: 'Phone Number',
              mixLine: 1,
            ),
            const SizedBox(height: 10,),
            TextUnit(text:'Class Room' ,
                color: Colors.black,
                size: 20,
                fontWeight: FontWeight.bold),
            Row(
              children: [
                Expanded(
                  child: TheFormFiled(
                    controller: classRoomArController,
                    hintText: 'Grade Ar',
                    mixLine: 1,
                  ),
                ),
                Expanded(
                  child: TheFormFiled(
                    controller: classRoomEnController,
                    hintText: 'Grade En',
                    mixLine: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            TextUnit(text:'Details' ,
                color: Colors.black,
                size: 20,
                fontWeight: FontWeight.bold),
            Row(
              children: [
                Expanded(
                  child: TheFormFiled(
                    controller: detailsArController,
                    hintText: 'Details Ar',
                    mixLine: 4,
                  ),
                ),
                Expanded(
                  child: TheFormFiled(
                    controller: detailsEnController,
                    hintText: 'Details En',
                    mixLine: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            MaButton(name: 'Update',
                fct: (){},
                size: 20),
          ],
        ),
      ),
    );
  }


}




class EditProfessor extends StatelessWidget {
  const EditProfessor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder:(context,index){
          return ShowDateTeacher(
           gradeAr: '',
            gradeEn: '',
            phoneNumber: '',
            email: '',
            detailsAr: '',
            detailsEn: '',
            nameAr: '',
            nameEn: '',
            id: '1',
            rate: '',
            imageWeb: '',
          );
        } );
  }
}

