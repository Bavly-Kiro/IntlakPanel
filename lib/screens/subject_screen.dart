
import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/buttons.dart';
import 'package:intlakpanel/widget/form_filed.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';

class MainSubjectScreen extends StatefulWidget {
  const MainSubjectScreen({Key? key}) : super(key: key);

  @override
  State<MainSubjectScreen> createState() => _MainSubjectScreenState();
}

class _MainSubjectScreenState extends State<MainSubjectScreen> {
  bool isSubject=true;
  bool isChapter=false;
  bool isLesson=false;
  bool isVideo=false;

  void changeSubject(){
    setState(() {
       isSubject=true;
       isChapter=false;
       isLesson=false;
       isVideo=false;
    });

  }
  void changeChapter(){
    setState(() {
      isSubject=false;
      isChapter=true;
      isLesson=false;
      isVideo=false;
    });

  }
  void changeLesson(){
    setState(() {
      isSubject=false;
      isChapter=false;
      isLesson=true;
      isVideo=false;
    });

  }
  void changeVideo(){
    setState(() {
      isSubject=false;
      isChapter=false;
      isLesson=false;
      isVideo=true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Main Subject',
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
                  onPressed: changeSubject,
                  child:const  Text('Subject'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: changeChapter,
                  child:const  Text('Chapter'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: changeLesson,
                  child:const  Text('Lesson'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: changeVideo,
                  child:const  Text('Video'),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(30),
          child:
          isSubject? const SubjectScreen() :
          isChapter? const ChapterScreen() :
          isLesson? const LessonScreen() :
          isVideo? const VideoScreen() :
          Container(),
        ),)
      ],
    );
  }
}

class SubjectScreen extends StatefulWidget {
  const  SubjectScreen({Key? key}) : super(key: key);
  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}
class _SubjectScreenState extends State<SubjectScreen> {
  late final TextEditingController subjectArController=TextEditingController(text: '');
  late final TextEditingController subjectEnController=TextEditingController(text: '');


  late final TextEditingController editSubjectArController=TextEditingController(text: '');
  late final TextEditingController editSubjectEnController=TextEditingController(text: '');


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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Subject',
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
                            controller:subjectArController,
                            hintText: 'Subject Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:subjectEnController,
                            hintText: 'subject En',
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
                                    TextSpan(text: 'Subject Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Subject Ar',style:  TextStyle(
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
                                     TextSpan(text: 'Subject En',style:  TextStyle(
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
                                              TheFormFiled(
                                                controller:editSubjectArController,
                                                hintText: 'Subject Ar',
                                                mixLine: 1,
                                              ),
                                              TheFormFiled(
                                                controller:editSubjectEnController,
                                                hintText: 'Subject En',
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

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({Key? key}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}
class _ChapterScreenState extends State<ChapterScreen> {
  late final TextEditingController chapterArController=TextEditingController(text: '');
  late final TextEditingController chapterEnController=TextEditingController(text: '');
  late final TextEditingController subjectController=TextEditingController(text: '');

  late final TextEditingController editSubjectController=TextEditingController(text: '');
  late final TextEditingController editChapterArController=TextEditingController(text: '');
  late final TextEditingController editChapterEnController=TextEditingController(text: '');
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
  List<String> subject=['subject1','subject2','subject3'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Chapter',
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
                        controller: subjectController,
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
                            hintText: 'Subject',
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
                                      ...subject.map((e){
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
                            controller:chapterArController,
                            hintText: 'Chapter Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:chapterEnController,
                            hintText: 'Chapter En',
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
                                    TextSpan(text: 'Chapter Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Chapter ar',style:  TextStyle(
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
                                    TextSpan(text: 'Chapter En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Chapter en',style:  TextStyle(
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
                                                controller: editSubjectController,
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
                                                    hintText: 'Subject',
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
                                                              ...subject.map((e){
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
                                                controller:editChapterArController,
                                                hintText: 'Chapter Ar',
                                                mixLine: 1,
                                              ),
                                              TheFormFiled(
                                                controller:editChapterEnController,
                                                hintText: 'Chapter En',
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

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}
class _LessonScreenState extends State<LessonScreen> {
  late final TextEditingController lessonArController=TextEditingController(text: '');
  late final TextEditingController lessonEnController=TextEditingController(text: '');
  late final TextEditingController subjectController=TextEditingController(text: '');
  late final TextEditingController chapterController=TextEditingController(text: '');

  late final TextEditingController editLessonArController=TextEditingController(text: '');
  late final TextEditingController editLessonEnController=TextEditingController(text: '');
  late final TextEditingController editSubjectController=TextEditingController(text: '');
  late final TextEditingController editChapterController=TextEditingController(text: '');
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

  List<String> subject=['subject1','subject2','subject3'];
  List<String> chapter=['chapter1','chapter2','chapter3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Lesson',
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
                        controller: subjectController,
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
                            hintText: 'Subject',
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
                                      ...subject.map((e){
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
                        controller: chapterController,
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
                            hintText: 'Chapter',
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
                                      ...chapter.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              chapterController.text=e;
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
                            controller:lessonArController,
                            hintText: 'Lesson Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:lessonEnController,
                            hintText: 'Lesson En',
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
                                    TextSpan(text: 'Chapter Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Chapter ar',style:  TextStyle(
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
                                    TextSpan(text: 'Chapter En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Chapter en',style:  TextStyle(
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
                                    TextSpan(text: 'Lesson Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Lesson ar',style:  TextStyle(
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
                                    TextSpan(text: 'Lesson En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Lesson en',style:  TextStyle(
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
                                                controller: editSubjectController,
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
                                                    hintText: 'Subject',
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
                                                              ...subject.map((e){
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
                                                controller: editChapterController,
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
                                                    hintText: 'Chapter',
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
                                                              ...chapter.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editChapterController.text=e;
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
                                                controller:editLessonArController,
                                                hintText: 'Lesson Ar',
                                                mixLine: 1,
                                              ),
                                              TheFormFiled(
                                                controller:editLessonEnController,
                                                hintText: 'Lesson En',
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

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}
class _VideoScreenState extends State<VideoScreen> {
  late final TextEditingController videoArController=TextEditingController(text: '');
  late final TextEditingController videoEnController=TextEditingController(text: '');
  late final TextEditingController subjectController=TextEditingController(text: '');
  late final TextEditingController chapterController=TextEditingController(text: '');
  late final TextEditingController lessonController=TextEditingController(text: '');
  
  late final TextEditingController editVideoArController=TextEditingController(text: '');
  late final TextEditingController editVideoEnController=TextEditingController(text: '');
  late final TextEditingController editSubjectController=TextEditingController(text: '');
  late final TextEditingController editChapterController=TextEditingController(text: '');
  late final TextEditingController editLessonController=TextEditingController(text: '');
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

  List<String> subject=['subject1','subject2','subject3'];
  List<String> chapter=['chapter1','chapter2','chapter3'];
  List<String> lesson=['lesson1','lesson2','lesson3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Video',
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
                        controller: subjectController,
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
                            hintText: 'Subject',
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
                                      ...subject.map((e){
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
                        controller: chapterController,
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
                            hintText: 'Chapter',
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
                                      ...chapter.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              chapterController.text=e;
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
                        controller: lessonController,
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
                            hintText: 'Lesson',
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
                                      ...lesson.map((e){
                                        return DropdownMenuItem(
                                          value: e,
                                          onTap: (){
                                            setState(() {
                                              value=e;
                                              lessonController.text=e;
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
                            controller:videoArController,
                            hintText: 'video Ar',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: TheFormFiled(
                            controller:videoEnController,
                            hintText: 'video En',
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
                                    TextSpan(text: 'Chapter Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Chapter ar',style:  TextStyle(
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
                                    TextSpan(text: 'Chapter En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Chapter en',style:  TextStyle(
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
                                    TextSpan(text: 'Lesson Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Lesson ar',style:  TextStyle(
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
                                    TextSpan(text: 'Lesson En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Lesson en',style:  TextStyle(
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
                                    TextSpan(text: 'Video Ar : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    const  TextSpan(text: 'Video ar',style:  TextStyle(
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
                                    TextSpan(text: 'Video En : ',style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    ),
                                    TextSpan(text: 'Video en',style:  TextStyle(
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
                                                controller: editSubjectController,
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
                                                    hintText: 'Subject',
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
                                                              ...subject.map((e){
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
                                                controller: editChapterController,
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
                                                    hintText: 'Chapter',
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
                                                              ...chapter.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editChapterController.text=e;
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
                                                controller: editLessonController,
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
                                                    hintText: 'Lesson',
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
                                                              ...lesson.map((e){
                                                                return DropdownMenuItem(
                                                                  value: e,
                                                                  onTap: (){
                                                                    setState(() {
                                                                      value=e;
                                                                      editLessonController.text=e;
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
                                                controller:editVideoArController,
                                                hintText: 'Video Ar',
                                                mixLine: 1,
                                              ),
                                              TheFormFiled(
                                                controller:editVideoEnController,
                                                hintText: 'Video En',
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