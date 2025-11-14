import 'package:bookhaven/ui/widgets/input_field.dart';
import 'package:bookhaven/ui/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _toggleValues = [true,false];
  var _signUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF8F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Container(
            width: double.infinity,
            height: _signUp ? MediaQuery.of(context).size.height/1.675 : MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Color(0xFFE6DFD6),
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              spacing: 5,
              children: [
                SizedBox(height: 5),
                Icon(Icons.menu_book_outlined,size: 45),
                SizedBox(height: 10),
                Text('Welcome to BookHaven',style: Theme.of(context).textTheme.headlineSmall),
                Text('Sign in to save your favorite books',style: TextStyle(letterSpacing: 0,fontWeight: FontWeight.w400,color: Color(0xFF6D6159)),),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ToggleContainer(
                        toggleValues: _toggleValues, 
                        onPressedFunction: (index){
                            setState(() {
                              for(int i = 0;i<_toggleValues.length;i++){
                                _toggleValues[i] = i == index;
                              }
                              _signUp = !_signUp;
                            });
                          }),
                      if(_signUp)
                        InputField(
                          fieldName: 'Full Name',
                          hintText: 'John Doe',
                          controller: TextEditingController(),
                        ),
                      InputField(
                        fieldName: 'Email', 
                        hintText: 'you@example.com',
                        controller: TextEditingController()
                      ),
                      InputField(
                        fieldName: 'Password', 
                        hintText: '•••••••', 
                        controller: TextEditingController()),
                      TextButton(
                        onPressed: (){}, 
                        child: Text(_signUp ? 'Sign Up' :'Sign In'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFF08D2D),
                          minimumSize: Size(double.infinity,40)
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}