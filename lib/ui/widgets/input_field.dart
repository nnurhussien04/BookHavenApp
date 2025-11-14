import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.fieldName,
    required this.hintText,
    required this.controller
  });
  
  String fieldName;
  String hintText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(fieldName,style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0XFFFFFBF5),
            border: Border.all(
              color: Color(0xFFE6DFD6),
              width: 1.0
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15,0,0,12),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(letterSpacing: -1,),
              constraints: BoxConstraints.tight(Size(double.infinity, 38))
            ),
          ),
        ),
      ],
    );
  }
}