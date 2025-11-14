import 'package:flutter/material.dart';

class ToggleContainer extends StatelessWidget {
  ToggleContainer({super.key,required this.toggleValues, required this.onPressedFunction});

  List<bool> toggleValues;
  Function (int) onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2),
      height: 40,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0XFFEBE5DD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.0,
          color: Color(0xFFE6DFD6)
        )
      ),
      //padding: EdgeInsets.all(8),
      child: ToggleButtons(
        isSelected: toggleValues,
        borderRadius: BorderRadius.circular(10),
        borderColor: Colors.transparent,
        constraints: BoxConstraints.tight(Size(170, 30)),
        selectedColor: Colors.black,
        // onPressed: (index){
        //   setState(() {
        //     for(int i = 0;i<_toggleValues.length;i++){
        //       _toggleValues[i] = i == index;
        //     }
        //     _signUp = !_signUp;
        //   });
        onPressed: onPressedFunction,
        //borderColor: ,
        // selectedColor: Colors.black,
        // selectedBorderColor: Theme.of(context).primaryColor,
        children: [
          Text('Sign In',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1)),
          Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),)
        ],
      )
    );
  }
}