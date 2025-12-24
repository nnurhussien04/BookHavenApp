import 'package:bookhaven/viewmodel/book_viewmodel.dart';
import 'package:flutter/material.dart';




class FilterDropDown extends StatelessWidget {
  FilterDropDown({
    super.key,
    required this.value,
    this.selectedValue
  });

  final Function(dynamic value) value;
  String? selectedValue;



  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      textStyle: TextStyle(
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w500
      ),
      initialSelection: selectedValue ?? 'All Categories',
      trailingIcon: Center(child: Icon(Icons.keyboard_arrow_down,size: 20,color: Colors.grey)),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconConstraints: BoxConstraints.tightFor(width: 50,height: 120),
        contentPadding: EdgeInsets.only(left: 15),
        constraints: BoxConstraints.tight(Size.fromHeight(40)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE6DFD6)
          ),
          borderRadius: BorderRadius.circular(10)
        )
      ),
      menuStyle: MenuStyle(
        alignment: Alignment.center,
        backgroundColor: WidgetStateProperty.fromMap(
          {
            for (var state in WidgetState.values) state: Colors.white,
            WidgetState.pressed: Colors.lightBlue,
          }
        ),
        shape: WidgetStateProperty.fromMap({
          WidgetState.any:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        })
      ),
      width: double.infinity,
      menuHeight: double.infinity,
      dropdownMenuEntries: ['All Categories','Science Fiction','Classic Fiction','Fantasy','Romance','Fiction'].map((x) => DropdownMenuEntry(value: x, label: x)).toList(),
      onSelected: value,
    );
  }
}