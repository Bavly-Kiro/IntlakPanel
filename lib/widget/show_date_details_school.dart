
import 'package:intlakpanel/units/constants.dart';
import 'package:flutter/material.dart';



class ShowDateDetailsSchool extends StatelessWidget {

  final String countryAr;
  final String countryEn;
  final String codeCountry;
  final String specialtyEn;
  final String specialtyAr;
  final String classRoomAr;
  final String classRoomEn;
  final String typeOfSchoolAr;
  final String typeOfSchoolEn;

  final String id;

  ShowDateDetailsSchool({Key? key, required this.id, required this.countryAr, required this.countryEn, required this.codeCountry, required this.specialtyEn, required this.specialtyAr, required this.classRoomAr, required this.classRoomEn, required this.typeOfSchoolAr, required this.typeOfSchoolEn,}) : super(key: key);

   Widget showDate(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text:  TextSpan(
                  children: [
                    TextSpan(text: 'Country Ar : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: countryAr,style: const TextStyle(
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
                    TextSpan(text: 'Country En : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: countryEn,style: const TextStyle(
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
                    TextSpan(text: 'Code Country : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: codeCountry,style: const TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text:  TextSpan(
                  children: [
                    TextSpan(text: 'Specialty Ar : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: specialtyAr,style: const TextStyle(
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
                    TextSpan(text: 'Specialty En : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: specialtyEn,style: const TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text:  TextSpan(
                  children: [
                    TextSpan(text: 'ClassRoom Ar : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: classRoomAr,style: const TextStyle(
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
                    TextSpan(text: 'ClassRoom En : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: classRoomEn,style: const TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text:  TextSpan(
                  children: [
                    TextSpan(text: 'Type Of School Ar : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: typeOfSchoolAr,style: const TextStyle(
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
                    TextSpan(text: 'Type Of School En : ',style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    TextSpan(text: typeOfSchoolEn,style: const TextStyle(
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

                  /*Get.defaultDialog(
                      barrierDismissible: false,
                      title: 'Edit Committees'.tr,
                      titleStyle: TextStyle(
                        color: mainColor,
                        fontSize: 25,
                      ),
                      backgroundColor: Colors.white,
                      confirmTextColor: Colors.white,
                      textCancel: 'back',
                      textConfirm: 'Edit',
                      onConfirm: (){
                        controller.editCommittees(id: id,lastNameImage: nameEn);
                      },
                      onCancel: (){
                        controller.clearEditCommittees();
                      },
                      content: Expanded(
                        child: SizedBox(
                          width: 500,
                          child: SingleChildScrollView(
                            child: Form(
                              key: controller.editCommitteesKey,
                              child: Column(
                                children: [
                                  Container(
                                    margin:const  EdgeInsets.all(10),
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: controller.result==null?
                                        Image.network(urlImagePanelLink,
                                          fit: BoxFit.fill,):
                                        Image.memory(controller.uploadFile!)
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  ElevatedButton(
                                    onPressed: ()=>controller.openPicker(isUpload: false),
                                    child:const  Text('Pic Image'),
                                  ),
                                  TheFormFiled(
                                    controller: controller.editCommitteesNameArController,
                                    hintText: 'Edit Committees Name Ar',
                                    mixLine: 1,
                                  ),
                                  const SizedBox(height: 10,),
                                  TheFormFiled(
                                    controller: controller.editCommitteesNameEnController,
                                    hintText: 'Edit Committees Name En',
                                    mixLine: 1,
                                  ),
                                  const SizedBox(height: 10,),
                                  TheFormFiled(
                                    controller: controller.editCommitteesDescArController,
                                    hintText: 'Edit Committees Desc Ar',
                                    mixLine: 8,
                                  ),
                                  const SizedBox(height: 10,),
                                  TheFormFiled(
                                    controller: controller.editCommitteesDescEnController,
                                    hintText: 'Edit Committees Desc En',
                                    mixLine: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  );*/

                },
                child:const  Text('Edit'),
              ),
            ),),
            Expanded(child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ElevatedButton(
                onPressed: (){
                  /*Get.defaultDialog(
                    title: 'Delete'.tr,
                    titleStyle:const  TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                    ),
                    backgroundColor: Colors.white,
                    textCancel: 'Cancel',
                    textConfirm: 'yes',
                    confirmTextColor: Colors.white,
                    onConfirm: (){
                      controller.deleteCommittees(id: id,nameImage: nameEn);
                      Get.back();
                      GlobalMethod.showSuccessfullyDialog(msg: 'Delete Successfully');
                    },
                    content: TextUnit(text: 'I am sure to Delete',
                      color: Colors.black,
                      size: 20,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.center,),
                  );*/
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
    );
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
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
      child:size.width<=950?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           showDate(),
        ],
      ) :
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: showDate(),
          ),
        ],
      ) ,
    );
  }
}
