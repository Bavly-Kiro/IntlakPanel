
import 'package:flutter/material.dart';
import 'package:intlakpanel/units/constants.dart';

class SelectedFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<DropdownMenuItem<String>> list;
  const SelectedFormFiled({Key? key, required this.controller, required this.hintText, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
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
                  enabled: false,
                  hintText: hintText,
                  hintStyle:   const TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1
                      )
                  ),
                  border: OutlineInputBorder(
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
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  onChanged: (value) {},
                  hint: const Text('Select '),
                  items:  list,
                )),
          )
        ],
      ),
    );
  }
}
