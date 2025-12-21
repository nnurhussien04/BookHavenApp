import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  InputField({
    super.key,
    required this.fieldName,
    required this.hintText,
    required this.controller,
    this.passwordInput
  });
  
  String fieldName;
  String hintText;
  TextEditingController controller;
  bool? passwordInput;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(widget.fieldName,style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),),
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
          child: 
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15,0,0,12),
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(letterSpacing: -1,),
                        constraints: BoxConstraints.tight(Size(double.infinity, 40))
                      ),
                      obscureText: widget.passwordInput ?? false,
                      obscuringCharacter: "•",
                    ),
                  ),
                  if(widget.passwordInput!=null)
                    GestureDetector(
                      onTapDown: (_){
                        setState(() {
                          widget.passwordInput = false;
                        });
                      },
                      onTapUp: (_){
                        setState(() {
                          widget.passwordInput = true;
                        });
                      },
                      onTapCancel: (){
                        setState(() {
                          widget.passwordInput = true;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(widget.passwordInput! ? Icons.key : Icons.key_off),
                          SizedBox(width: 10)
                        ],
                      ))
                  
                ],
              ),
        ),
      ],
    );
  }
}