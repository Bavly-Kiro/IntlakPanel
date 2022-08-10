
import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/buttons.dart';
import 'package:intlakpanel/widget/form_filed.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:intlakpanel/widget/show_date_details_school.dart';
import 'package:flutter/material.dart';

class DetailsSchoolScreen extends StatefulWidget {
  const DetailsSchoolScreen({Key? key}) : super(key: key);

  @override
  State<DetailsSchoolScreen> createState() => _DetailsSchoolScreenState();
}

class _DetailsSchoolScreenState extends State<DetailsSchoolScreen> {
   bool isCountry=true;
   bool isMajor=false;
   bool isGrate=false;
   bool isTypeOfSchool=false;

   void changeCountry(){
    setState(() {
       isCountry=true;
       isMajor=false;
       isGrate=false;
       isTypeOfSchool=false;
    });

   }
   void changeMajor(){
     setState(() {
       isCountry=false;
       isMajor=true;
       isGrate=false;
       isTypeOfSchool=false;
     });

   }
   void changeGrate(){
     setState(() {
       isCountry=false;
       isMajor=false;
       isGrate=true;
       isTypeOfSchool=false;
     });

   }
   void changeTypeOfSchool(){
     setState(() {
       isCountry=false;
       isMajor=false;
       isGrate=false;
       isTypeOfSchool=true;
     });

   }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Details School',
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
                  onPressed: changeCountry,
                  child:const  Text('Country'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: changeMajor,
                  child:const  Text('Major'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: changeGrate,
                  child:const  Text('Grade'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: changeTypeOfSchool,
                  child:const  Text('Type Of School'),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(30),
          child:
          isCountry? const CountryScreen() :
          isMajor? const MajorScreen() :
          isGrate? const GradeScreen() :
          isTypeOfSchool? const TypeOfSchool() :
           Container(),
        ),)
      ],
    );
  }
}

class CountryScreen extends StatefulWidget {
  const  CountryScreen({Key? key}) : super(key: key);
  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late final TextEditingController countryArController=TextEditingController(text: '');
  late final TextEditingController countryEnController=TextEditingController(text: '');
  late final TextEditingController codeCountryController=TextEditingController(text: '');

  late final TextEditingController editCountryArController=TextEditingController(text: '');
  late final TextEditingController editCountryEnController=TextEditingController(text: '');
  late final TextEditingController editCodeCountryController=TextEditingController(text: '');

  var formKey=GlobalKey<FormState>();
  var editFormKey=GlobalKey<FormState>();

  bool isAdd=false;
   bool isEdit=true;
   void changeAdd(){
     setState(() {
       isAdd=true;
       isEdit=false;
     });

   }
   void changeEdit(){
     setState(() {
       isAdd=false;
       isEdit=true;
     });
   }

  String value = '';
   List<String> codeCountry=['+20','+21'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Country',
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
                child:const  Text('Edit'),
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
                  Row(
                    children: [
                      Expanded(
                        child: TheFormFiled(
                          controller:countryArController,
                          hintText: 'Country Ar',
                          mixLine: 1,
                        ),
                      ),
                      Expanded(
                        child: TheFormFiled(
                          controller:countryArController,
                          hintText: 'Country En',
                          mixLine: 1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: codeCountryController,
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter The date';
                              }
                              return null;
                            },
                            decoration:   InputDecoration(
                                hintText: 'Code Country',
                                hintStyle:   const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        onChanged: (value) {},
                                        hint: const Text('Select '),
                                        items:  [
                                          ...codeCountry.map((e){
                                            return DropdownMenuItem(
                                              value: e,
                                              onTap: (){
                                                setState(() {
                                                  value=e;
                                                  editCodeCountryController.text=e;
                                                });
                                              },
                                              child:   Text(e),
                                            );

                                          }),
                                        ],
                                      )),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:  BorderSide(
                                        color: mainColor,
                                        width: 1
                                    )
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                  TextSpan(text: 'Country Ar : ',style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  ),
                                 const  TextSpan(text: 'القاهره',style:  TextStyle(
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
                                  TextSpan(text: 'Egypt',style:  TextStyle(
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
                                  const TextSpan(text: '+20',style:  TextStyle(
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
                                            TextFormField(
                                              controller: editCodeCountryController,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20
                                              ),
                                              validator: (value){
                                                if(value!.isEmpty){
                                                  return 'Please Enter The date';
                                                }
                                                return null;
                                              },
                                              decoration:   InputDecoration(
                                                  hintText: 'Code Country',
                                                  hintStyle:   const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20
                                                  ),
                                                  suffixIcon: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton<String>(
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                          ),
                                                          onChanged: (value) {},
                                                          hint: const Text('Select '),
                                                          items: [
                                                            ...codeCountry.map((e){
                                                              return DropdownMenuItem(
                                                                value: e,
                                                                onTap: (){
                                                                  setState(() {
                                                                    value=e;
                                                                    editCodeCountryController.text=e;
                                                                  });
                                                                },
                                                                child:   Text(e),
                                                              );

                                                            }),
                                                          ]
                                                      ),
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: const BorderSide(
                                                          color: Colors.grey,
                                                          width: 1
                                                      )
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide:  BorderSide(
                                                          color: mainColor,
                                                          width: 1
                                                      )
                                                  )
                                              ),
                                            ),

                                            TheFormFiled(
                                              controller:editCountryArController,
                                              hintText: 'Country Ar',
                                              mixLine: 1,
                                            ),
                                            TheFormFiled(
                                              controller:editCountryEnController,
                                              hintText: 'Country En',
                                              mixLine: 1,
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



class MajorScreen extends StatefulWidget {
  const MajorScreen({Key? key}) : super(key: key);

  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  late final TextEditingController majorArController=TextEditingController(text: '');
  late final TextEditingController majorEnController=TextEditingController(text: '');
  late final TextEditingController countryController=TextEditingController(text: '');

  late final TextEditingController editCountryController=TextEditingController(text: '');
  late final TextEditingController editMajorArController=TextEditingController(text: '');
  late final TextEditingController editMajorEnController=TextEditingController(text: '');
  var formKey=GlobalKey<FormState>();
  var editFormKey=GlobalKey<FormState>();
  bool isAdd=false;
  bool isEdit=true;
  void changeAdd(){
    setState(() {
      isAdd=true;
      isEdit=false;
    });

  }
  void changeEdit(){
    setState(() {
      isAdd=false;
      isEdit=true;
    });
  }

  String value = '';
  List<String> country=['country1','country2','country3'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Major',
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
                child:const  Text('Edit'),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: countryController,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter The date';
                          }
                          return null;
                        },
                        decoration:   InputDecoration(
                            hintText: 'Country',
                            hintStyle:   const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    onChanged: (value) {},
                                    hint: const Text('Select '),
                                    items: [
                                      ...country.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              countryController.text=e;
                                            });
                                          },
                                          child:   Text(e),
                                        );

                                      }),
                                    ]
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:  BorderSide(
                                    color: mainColor,
                                    width: 1
                                )
                            )
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:majorArController,
                            hintText: 'Major Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:majorEnController,
                            hintText: 'Major En',
                            mixLine: 1,
                          ),
                        ),

                      ],
                    ),
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
                                    TextSpan(text: 'Country Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'القاهره',style:  TextStyle(
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
                                    TextSpan(text: 'Egypt',style:  TextStyle(
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
                                    const TextSpan(text: '+20',style:  TextStyle(
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
                                    TextSpan(text: 'Major Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'major ar',style:  TextStyle(
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
                                    TextSpan(text: 'Major En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'major en',style:  TextStyle(
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
                                              TextFormField(
                                                controller: editCountryController,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                                validator: (value){
                                                  if(value!.isEmpty){
                                                    return 'Please Enter The date';
                                                  }
                                                  return null;
                                                },
                                                decoration:   InputDecoration(
                                                    hintText: 'Country',
                                                    hintStyle:   const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20
                                                    ),
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                            onChanged: (value) {},
                                                            hint: const Text('Select '),
                                                            items: [
                                                              ...country.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editCountryController.text=e;
                                                                    });
                                                                  },
                                                                  child:   Text(e),
                                                                );

                                                              }),
                                                            ]
                                                        ),
                                                      ),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 1
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide:  BorderSide(
                                                            color: mainColor,
                                                            width: 1
                                                        )
                                                    )
                                                ),
                                              ),

                                              TheFormFiled(
                                                controller:editMajorArController,
                                                hintText: 'Major Ar',
                                                mixLine: 1,
                                              ),
                                              TheFormFiled(
                                                controller:editMajorEnController,
                                                hintText: 'Major En',
                                                mixLine: 1,
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

class GradeScreen extends StatefulWidget {
  const GradeScreen({Key? key}) : super(key: key);

  @override
  State<GradeScreen> createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  late final TextEditingController gradeArController=TextEditingController(text: '');
  late final TextEditingController gradeEnController=TextEditingController(text: '');
  late final TextEditingController countryController=TextEditingController(text: '');
  late final TextEditingController majorController=TextEditingController(text: '');

  late final TextEditingController editGradeArController=TextEditingController(text: '');
  late final TextEditingController editGradeEnController=TextEditingController(text: '');
  late final TextEditingController editCountryController=TextEditingController(text: '');
  late final TextEditingController editMajorController=TextEditingController(text: '');
  var formKey=GlobalKey<FormState>();
  var editFormKey=GlobalKey<FormState>();
  bool isAdd=false;
  bool isEdit=true;

  void changeAdd(){
    setState(() {
      isAdd=true;
      isEdit=false;
    });

  }

  void changeEdit(){
    setState(() {
      isAdd=false;
      isEdit=true;
    });
  }



  String value = '';

  List<String> country=['country1','country2','country3'];
  List<String> major=['major1','major2','major3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Grade',
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
                child:const  Text('Edit'),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: countryController,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter The date';
                          }
                          return null;
                        },
                        decoration:   InputDecoration(
                            hintText: 'Country',
                            hintStyle:   const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    onChanged: (value) {},
                                    hint: const Text('Select '),
                                    items: [
                                      ...country.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              countryController.text=e;
                                            });
                                          },
                                          child:   Text(e),
                                        );

                                      }),
                                    ]
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:  BorderSide(
                                    color: mainColor,
                                    width: 1
                                )
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: majorController,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter The date';
                          }
                          return null;
                        },
                        decoration:   InputDecoration(
                            hintText: 'Major',
                            hintStyle:   const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    onChanged: (value) {},
                                    hint: const Text('Select '),
                                    items: [
                                      ...major.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              countryController.text=e;
                                            });
                                          },
                                          child:   Text(e),
                                        );

                                      }),
                                    ]
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:  BorderSide(
                                    color: mainColor,
                                    width: 1
                                )
                            )
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:gradeArController,
                            hintText: 'Grade Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:gradeEnController,
                            hintText: 'Grade En',
                            mixLine: 1,
                          ),
                        ),

                      ],
                    ),
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
                                    TextSpan(text: 'Country Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'القاهره',style:  TextStyle(
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
                                    TextSpan(text: 'Egypt',style:  TextStyle(
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
                                    const TextSpan(text: '+20',style:  TextStyle(
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
                                    TextSpan(text: 'Major Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'major ar',style:  TextStyle(
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
                                    TextSpan(text: 'Major En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'major en',style:  TextStyle(
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
                                    TextSpan(text: 'Grade Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'grade ar',style:  TextStyle(
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
                                    TextSpan(text: 'grade en',style:  TextStyle(
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
                                          TextFormField(
                                            controller: editCountryController,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20
                                            ),
                                            validator: (value){
                                              if(value!.isEmpty){
                                                return 'Please Enter The date';
                                              }
                                              return null;
                                            },
                                            decoration:   InputDecoration(
                                                hintText: 'Country',
                                                hintStyle:   const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                        onChanged: (value) {},
                                                        hint: const Text('Select '),
                                                        items: [
                                                          ...country.map((e){
                                                            return DropdownMenuItem(
                                                              value: e,
                                                              onTap: (){
                                                                setState(() {
                                                                  value=e;
                                                                  editCountryController.text=e;
                                                                });
                                                              },
                                                              child:   Text(e),
                                                            );

                                                          }),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(
                                                        color: Colors.grey,
                                                        width: 1
                                                    )
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide:  BorderSide(
                                                        color: mainColor,
                                                        width: 1
                                                    )
                                                )
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          TextFormField(
                                            controller: editMajorController,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20
                                            ),
                                            validator: (value){
                                              if(value!.isEmpty){
                                                return 'Please Enter The date';
                                              }
                                              return null;
                                            },
                                            decoration:   InputDecoration(
                                                hintText: 'Major',
                                                hintStyle:   const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                        onChanged: (value) {},
                                                        hint: const Text('Select '),
                                                        items: [
                                                          ...major.map((e){
                                                            return DropdownMenuItem(
                                                              value: e,
                                                              onTap: (){
                                                                setState(() {
                                                                  value=e;
                                                                  editMajorController.text=e;
                                                                });
                                                              },
                                                              child:   Text(e),
                                                            );

                                                          }),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(
                                                        color: Colors.grey,
                                                        width: 1
                                                    )
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide:  BorderSide(
                                                        color: mainColor,
                                                        width: 1
                                                    )
                                                )
                                            ),
                                          ),
                                          TheFormFiled(
                                            controller:editGradeArController,
                                            hintText: 'Grade Ar',
                                            mixLine: 1,
                                          ),
                                          TheFormFiled(
                                            controller:editGradeEnController,
                                            hintText: 'Grade En',
                                            mixLine: 1,
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

class TypeOfSchool extends StatefulWidget {
  const TypeOfSchool({Key? key}) : super(key: key);

  @override
  State<TypeOfSchool> createState() => _TypeOfSchoolState();
}

class _TypeOfSchoolState extends State<TypeOfSchool> {
  late final TextEditingController typeOfSchoolArController=TextEditingController(text: '');
  late final TextEditingController typeOfSchoolEnController=TextEditingController(text: '');
  late final TextEditingController countryController=TextEditingController(text: '');
  late final TextEditingController majorController=TextEditingController(text: '');
  late final TextEditingController gradeController=TextEditingController(text: '');


  late final TextEditingController editTypeSchoolArController=TextEditingController(text: '');
  late final TextEditingController editTypeSchoolEnController=TextEditingController(text: '');
  late final TextEditingController editCountryController=TextEditingController(text: '');
  late final TextEditingController editMajorController=TextEditingController(text: '');
  late final TextEditingController editGradeController=TextEditingController(text: '');
  var editFormKey=GlobalKey<FormState>();

  bool isAdd=false;
  bool isEdit=true;

  void changeAdd(){
    setState(() {
      isAdd=true;
      isEdit=false;
    });

  }

  void changeEdit(){
    setState(() {
      isAdd=false;
      isEdit=true;
    });
  }

  var formKey=GlobalKey<FormState>();

  String value = '';

  List<String> country=['country1','country2','country3'];
  List<String> major=['major1','major2','major3'];
  List<String> grade=['grade1','grade2','grade3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Type Of School',
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
                child:const  Text('Edit'),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: countryController,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter The date';
                          }
                          return null;
                        },
                        decoration:   InputDecoration(
                            hintText: 'Country',
                            hintStyle:   const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    onChanged: (value) {},
                                    hint: const Text('Select '),
                                    items: [
                                      ...country.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              countryController.text=e;
                                            });
                                          },
                                          child:   Text(e),
                                        );

                                      }),
                                    ]
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:  BorderSide(
                                    color: mainColor,
                                    width: 1
                                )
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: majorController,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter The date';
                          }
                          return null;
                        },
                        decoration:   InputDecoration(
                            hintText: 'Major',
                            hintStyle:   const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    onChanged: (value) {},
                                    hint: const Text('Select '),
                                    items: [
                                      ...major.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              countryController.text=e;
                                            });
                                          },
                                          child:   Text(e),
                                        );

                                      }),
                                    ]
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:  BorderSide(
                                    color: mainColor,
                                    width: 1
                                )
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: majorController,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter The date';
                          }
                          return null;
                        },
                        decoration:   InputDecoration(
                            hintText: 'Grade',
                            hintStyle:   const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    onChanged: (value) {},
                                    hint: const Text('Select '),
                                    items: [
                                      ...grade.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              countryController.text=e;
                                            });
                                          },
                                          child:   Text(e),
                                        );

                                      }),
                                    ]
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:  BorderSide(
                                    color: mainColor,
                                    width: 1
                                )
                            )
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:typeOfSchoolArController,
                            hintText: 'TypeSchool Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:typeOfSchoolEnController,
                            hintText: 'TypeSchool En',
                            mixLine: 1,
                          ),
                        ),

                      ],
                    ),
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
                                    TextSpan(text: 'Country Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'القاهره',style:  TextStyle(
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
                                    TextSpan(text: 'Egypt',style:  TextStyle(
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
                                    const TextSpan(text: '+20',style:  TextStyle(
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
                                    TextSpan(text: 'Major Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'major ar',style:  TextStyle(
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
                                    TextSpan(text: 'Major En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'major en',style:  TextStyle(
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
                                    TextSpan(text: 'Grade Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'grade ar',style:  TextStyle(
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
                                    TextSpan(text: 'grade en',style:  TextStyle(
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
                                    TextSpan(text: 'Type School En : ',style: TextStyle(
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
                                              TextFormField(
                                                controller: editCountryController,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                                validator: (value){
                                                  if(value!.isEmpty){
                                                    return 'Please Enter The date';
                                                  }
                                                  return null;
                                                },
                                                decoration:   InputDecoration(
                                                    hintText: 'Country',
                                                    hintStyle:   const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20
                                                    ),
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                            onChanged: (value) {},
                                                            hint: const Text('Select '),
                                                            items: [
                                                              ...country.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editCountryController.text=e;
                                                                    });
                                                                  },
                                                                  child:   Text(e),
                                                                );

                                                              }),
                                                            ]
                                                        ),
                                                      ),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 1
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide:  BorderSide(
                                                            color: mainColor,
                                                            width: 1
                                                        )
                                                    )
                                                ),
                                              ),
                                              const SizedBox(height: 10,),
                                              TextFormField(
                                                controller: editMajorController,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                                validator: (value){
                                                  if(value!.isEmpty){
                                                    return 'Please Enter The date';
                                                  }
                                                  return null;
                                                },
                                                decoration:   InputDecoration(
                                                    hintText: 'Major',
                                                    hintStyle:   const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20
                                                    ),
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                            onChanged: (value) {},
                                                            hint: const Text('Select '),
                                                            items: [
                                                              ...major.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editMajorController.text=e;
                                                                    });
                                                                  },
                                                                  child:   Text(e),
                                                                );

                                                              }),
                                                            ]
                                                        ),
                                                      ),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 1
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide:  BorderSide(
                                                            color: mainColor,
                                                            width: 1
                                                        )
                                                    )
                                                ),
                                              ),
                                              const SizedBox(height: 10,),
                                              TextFormField(
                                                controller: editGradeController,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                                validator: (value){
                                                  if(value!.isEmpty){
                                                    return 'Please Enter The date';
                                                  }
                                                  return null;
                                                },
                                                decoration:   InputDecoration(
                                                    hintText: 'Grade',
                                                    hintStyle:   const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20
                                                    ),
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                            style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                            onChanged: (value) {},
                                                            hint: const Text('Select '),
                                                            items: [
                                                              ...grade.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editGradeController.text=e;
                                                                    });
                                                                  },
                                                                  child:   Text(e),
                                                                );

                                                              }),
                                                            ]
                                                        ),
                                                      ),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(
                                                            color: Colors.grey,
                                                            width: 1
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide:  BorderSide(
                                                            color: mainColor,
                                                            width: 1
                                                        )
                                                    )
                                                ),
                                              ),
                                              TheFormFiled(
                                                controller:editTypeSchoolArController,
                                                hintText: 'TypeSchool Ar',
                                                mixLine: 1,
                                              ),
                                              TheFormFiled(
                                                controller:editTypeSchoolEnController,
                                                hintText: 'TypeSchool En',
                                                mixLine: 1,
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