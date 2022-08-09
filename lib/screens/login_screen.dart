
import 'package:intlakpanel/screens/home-panel-sceen.dart';
import 'package:intlakpanel/units/constants.dart';
import 'package:intlakpanel/widget/form_filed.dart';
import 'package:intlakpanel/widget/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email=TextEditingController();

  final TextEditingController _password=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool isNotShowPass=true;

  void changeShowPass(){
    setState(() {
      isNotShowPass=!isNotShowPass;
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
        body:
        SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height/3,
                    ),
                    SizedBox(
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                             width: 500,
                            height: 50,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight:Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: TextUnit(
                                size: 20,
                                color: Colors.white,
                                text: 'Login',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please enter The date';
                              }
                              return '';
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                            ),
                            controller: _email,

                          ),

                          const SizedBox(height: 20,),

                          SizedBox(
                            height: kBottomNavigationBarHeight,
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                              validator: (value){
                                if(value!.length<6){
                                  return 'Please enter The date';
                                }
                                return '';
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    changeShowPass();
                                  },
                                  icon: Icon(isNotShowPass?Icons.visibility_off:Icons.visibility,
                                    color: Colors.black,),
                                ),
                              ),
                              controller: _password,
                              obscureText: isNotShowPass,

                            ),
                          ),
                          const SizedBox(height: 20,),
                          MaterialButton(onPressed: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePanelScreen()));
                          },
                            height: 50,
                            color: mainColor,
                            padding: const EdgeInsets.all(12),
                            minWidth: 500,
                            shape: const RoundedRectangleBorder(
                              borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight:Radius.circular(20),
                              ),
                            ),
                            child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),),




                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ));
  }
}