
import 'package:intlakpanel/widget/buttons.dart';
import 'package:intlakpanel/widget/form_filed.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/material.dart';
import 'package:intlakpanel/widget/selected_textform.dart';

import '../units/constants.dart';


enum Answer{one,two,three,four}
class ExamScreen extends StatefulWidget {
  const  ExamScreen({Key? key}) : super(key: key);
  @override
  State<ExamScreen> createState() => _ExamScreenState();
}
class _ExamScreenState extends State<ExamScreen> {
  late final TextEditingController questionController=TextEditingController(text: '');
  late final TextEditingController typeQuestionController=TextEditingController(text: '');
  late final TextEditingController chapterController=TextEditingController(text: '');
  late final TextEditingController vedioController=TextEditingController(text: '');
  late final TextEditingController answerQuestionOneController=TextEditingController(text: '');
  late final TextEditingController answerQuestionTwoController=TextEditingController(text: '');
  late final TextEditingController answerQuestionThreeController=TextEditingController(text: '');
  late final TextEditingController answerQuestionFourController=TextEditingController(text: '');

  late final TextEditingController editQuestionController=TextEditingController(text: '');
  late final TextEditingController editTypeQuestionController=TextEditingController(text: '');
  late final TextEditingController editChoseTypeQuestionController=TextEditingController(text: '');
  late final TextEditingController editChapterController=TextEditingController(text: '');
  late final TextEditingController editVedioController=TextEditingController(text: '');
  late final TextEditingController editAnswerQuestionOneController=TextEditingController(text: '');
  late final TextEditingController editAnswerQuestionTwoController=TextEditingController(text: '');
  late final TextEditingController editAnswerQuestionThreeController=TextEditingController(text: '');
  late final TextEditingController editAnswerQuestionFourController=TextEditingController(text: '');

  var formKey=GlobalKey<FormState>();
  var editFormKey=GlobalKey<FormState>();

  bool isAdd=false;
  bool isShow=true;
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
  List<String> typeQuestion=['essay','Average','hard'];
  List<String> chapter=['chapter1','chapter2','chapter3'];
  List<String> vedio=['vedio1','vedio2','vedio3'];
  Answer answer=Answer.one;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: TextUnit(text: 'Exam',
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
                      hintText:'Chapter' ,
                      controller:chapterController ,
                      list: [ ...chapter.map((e){
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
                      })],
                    ),
                    SelectedFormFiled(
                      hintText:'Vedio' ,
                      controller:vedioController ,
                      list: [ ...vedio.map((e){
                        return DropdownMenuItem(
                          value: e,
                          onTap: (){
                            setState(() {
                              value=e;
                              vedioController.text=e;
                            });
                          },
                          child:   Text(e),
                        );
                      })],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:questionController,
                            hintText: 'Question',
                            mixLine: 3,
                          ),
                        ),
                        Expanded(
                          child: SelectedFormFiled(
                            hintText:'Type' ,
                            controller:typeQuestionController ,
                            list: [ ...typeQuestion.map((e){
                              return DropdownMenuItem(
                                value: e,
                                onTap: (){
                                  setState(() {
                                    value=e;
                                    typeQuestionController.text=e;
                                  });
                                },
                                child:   Text(e),
                              );
                            })],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:answerQuestionOneController,
                            hintText: 'Question One',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: Radio(
                            value: Answer.one,
                            groupValue: answer,
                            onChanged: (Answer? ans){
                              setState(() {
                                answer=ans!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:answerQuestionTwoController,
                            hintText: 'Question Two',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: Radio(
                            value: Answer.two,
                            groupValue: answer,
                            onChanged: (Answer? ans){
                              setState(() {
                                answer=ans!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:answerQuestionThreeController,
                            hintText: 'Question Three',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: Radio(
                            value: Answer.three,
                            groupValue: answer,
                            onChanged: (Answer? ans){
                              setState(() {
                                answer=ans!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TheFormFiled(
                            controller:answerQuestionFourController,
                            hintText: 'Question Four',
                            mixLine: 1,
                          ),
                        ),
                        Expanded(
                          child: Radio(
                            value: Answer.four,
                            groupValue: answer,
                            onChanged: (Answer? ans){
                              setState(() {
                                answer=ans!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child:  MaButton(name: 'Save',
                              fct: (){
                            setState(() {});
                              },
                              size: 20),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child:  MaButton(name: 'Not Save',
                              fct: (){},
                              size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            Column(
              children: [
                SelectedFormFiled(
                  hintText:'Choose Type Exam' ,
                  controller:editChoseTypeQuestionController ,
                  list: [ ...typeQuestion.map((e){
                    return DropdownMenuItem(
                      value: e,
                      onTap: (){
                        setState(() {
                          value=e;
                          editChoseTypeQuestionController.text=e;
                        });
                      },
                      child:   Text(e),
                    );
                  })],
                ),
                Expanded(
                  child: ListView.builder(
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
                                color: Colors.green,
                                width: 2
                            ),
                          ),
                          child:
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('question ',style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      Text('answer 1 ',style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      Text('answer 2  ',style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      Text('answer 3  ',style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      Text('answer 4  ',style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
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
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: TheFormFiled(
                                                                    controller:editQuestionController,
                                                                    hintText: 'Question',
                                                                    mixLine: 3,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: SelectedFormFiled(
                                                                    hintText:'Type' ,
                                                                    controller:editTypeQuestionController ,
                                                                    list: [ ...typeQuestion.map((e){
                                                                      return DropdownMenuItem(
                                                                        value: e,
                                                                        onTap: (){
                                                                          setState(() {
                                                                            value=e;
                                                                            editTypeQuestionController.text=e;
                                                                          });
                                                                        },
                                                                        child:   Text(e),
                                                                      );
                                                                    })],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: TheFormFiled(
                                                                    controller:editAnswerQuestionOneController,
                                                                    hintText: 'Question One',
                                                                    mixLine: 1,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Radio(
                                                                    value: Answer.one,
                                                                    groupValue: answer,
                                                                    onChanged: (Answer? ans){
                                                                      setState(() {
                                                                        answer=ans!;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: TheFormFiled(
                                                                    controller:editAnswerQuestionTwoController,
                                                                    hintText: 'Question Two',
                                                                    mixLine: 1,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Radio(
                                                                    value: Answer.two,
                                                                    groupValue: answer,
                                                                    onChanged: (Answer? ans){
                                                                      setState(() {
                                                                        answer=ans!;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: TheFormFiled(
                                                                    controller:editAnswerQuestionThreeController,
                                                                    hintText: 'Question Three',
                                                                    mixLine: 1,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Radio(
                                                                    value: Answer.three,
                                                                    groupValue: answer,
                                                                    onChanged: (Answer? ans){
                                                                      setState(() {
                                                                        answer=ans!;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: TheFormFiled(
                                                                    controller:editAnswerQuestionFourController,
                                                                    hintText: 'Question Four',
                                                                    mixLine: 1,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Radio(
                                                                    value: Answer.four,
                                                                    groupValue: answer,
                                                                    onChanged: (Answer? ans){
                                                                      setState(() {
                                                                        answer=ans!;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
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
                              } ),
                        );
                      } ),
                ),
              ],
            )
        ),)
      ],
    );
  }
}
