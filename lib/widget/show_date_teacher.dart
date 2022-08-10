
import 'dart:io';
import 'dart:typed_data';
import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/form_filed.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowDateTeacher extends StatefulWidget {

  final String nameAr;
  final String nameEn;
  final String email;
  final String phoneNumber;
  final String detailsAr;
  final String detailsEn;
  final String gradeAr;
  final String gradeEn;
  final String id;
  final String rate;
  final String imageWeb;

  ShowDateTeacher({Key? key, required this.id, required this.gradeAr, required this.gradeEn, required this.nameAr, required this.nameEn, required this.email, required this.phoneNumber, required this.detailsAr, required this.detailsEn, required this.rate, required this.imageWeb,}) : super(key: key);

  @override
  State<ShowDateTeacher> createState() => _ShowDateTeacherState();
}

class _ShowDateTeacherState extends State<ShowDateTeacher> {
  late final TextEditingController editNameArController=TextEditingController(text: '');

  late final TextEditingController editNameEnController=TextEditingController(text: '');

  late final TextEditingController editEmailController=TextEditingController(text: '');

  late final TextEditingController editGradeArController=TextEditingController(text: '');

  late final TextEditingController editGradeEnController=TextEditingController(text: '');

  late final TextEditingController editDetailsArController=TextEditingController(text: '');

  late final TextEditingController editDetailsEnController=TextEditingController(text: '');

  late final TextEditingController editPhoneNumberController=TextEditingController(text: '');

  var editFormKey=GlobalKey<FormState>();
  File? imagePiked;
  Uint8List imageWeb=Uint8List(8);

  @override
  Widget build(BuildContext context) {
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
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 5,),
          //Image.network('widget.imageWeb'),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              RichText(
                text:  TextSpan(
                    children: [
                      TextSpan(text: 'Name Ar : ',style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                      TextSpan(text: widget.nameAr,style: const TextStyle(
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
                      TextSpan(text: 'Name En : ',style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                      TextSpan(text: widget.nameEn,style: const TextStyle(
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
          RichText(
            text:  TextSpan(
                children: [
                  TextSpan(text: 'Email : ',style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                  TextSpan(text: widget.email,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                ]
            ),
          ),
          const SizedBox(height: 10,),
          RichText(
            text:  TextSpan(
                children: [
                  TextSpan(text: 'Phone Number : ',style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                  TextSpan(text: widget.phoneNumber,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                ]
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text:  TextSpan(
                    children: [
                      TextSpan(text: 'Grade Ar : ',style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                      TextSpan(text: widget.gradeAr,style: const TextStyle(
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
                      TextSpan(text: 'Grade En : ',style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      ),
                      TextSpan(text: widget.gradeEn,style: const TextStyle(
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
          RichText(
            text:  TextSpan(
                children: [
                  TextSpan(text: 'Details Ar : ',style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                  TextSpan(text: widget.detailsAr,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                ]
            ),
          ),
          const SizedBox(height: 10,),
          RichText(
            text:  TextSpan(
                children: [
                  TextSpan(text: 'Details En : ',style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                  TextSpan(text: widget.detailsEn,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                ]
            ),
          ),
          const SizedBox(height: 10,),
          RichText(
            text:  TextSpan(
                children: [
                  TextSpan(text: 'Rate : ',style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                  TextSpan(text: widget.rate,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                ]
            ),
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
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    height: 200,
                                    width: 200,
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
                                  TheFormFiled(
                                    controller:editNameArController,
                                    hintText: 'Name Ar',
                                    mixLine: 1,
                                  ),
                                  TheFormFiled(
                                    controller:editNameEnController,
                                    hintText: 'Name En',
                                    mixLine: 1,
                                  ),
                                  TheFormFiled(
                                    controller:editEmailController,
                                    hintText: 'Email',
                                    mixLine: 1,
                                  ),

                                  TheFormFiled(
                                    controller:editPhoneNumberController,
                                    hintText: 'Phone Number',
                                    mixLine: 1,
                                  ),
                                  TheFormFiled(
                                    controller:editGradeArController,
                                    hintText: 'Grade Ar',
                                    mixLine: 1,
                                  ),
                                  TheFormFiled(
                                    controller:editGradeArController,
                                    hintText: 'Grade En',
                                    mixLine: 1,
                                  ),
                                  TheFormFiled(
                                    controller:editDetailsArController,
                                    hintText: 'Details Ar',
                                    mixLine: 3,
                                  ),
                                  TheFormFiled(
                                    controller:editDetailsArController,
                                    hintText: 'Details En',
                                    mixLine: 3,
                                  ),

                                ],
                              ),
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
          const SizedBox(height: 10,),
        ],
      ) ,
    );
  }
}
