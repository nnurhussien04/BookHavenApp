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
                      Container(
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
                          isSelected: _toggleValues,
                          borderRadius: BorderRadius.circular(10),
                          borderColor: Colors.transparent,
                          constraints: BoxConstraints.tight(Size(170, 30)),
                          selectedColor: Colors.black,
                          onPressed: (index){
                            setState(() {
                              for(int i = 0;i<_toggleValues.length;i++){
                                _toggleValues[i] = i == index;
                              }
                              _signUp = !_signUp;
                            });
                          },
                          //borderColor: ,
                          // selectedColor: Colors.black,
                          // selectedBorderColor: Theme.of(context).primaryColor,
                          children: [
                            Text('Sign In',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1)),
                            Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),)
                          ],
                        ) 
                      ),
                      if(_signUp)
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text('Full Name',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),),
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
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15,0,0,12),
                                  border: InputBorder.none,
                                  hintText: 'John Doe',
                                  hintStyle: TextStyle(letterSpacing: -1,),
                                  constraints: BoxConstraints.tight(Size(double.infinity, 38))
                                ),
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text('Email',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),),
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
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(15,0,0,12),
                            border: InputBorder.none,
                            hintText: 'you@example.com',
                            hintStyle: TextStyle(letterSpacing: -1),
                            constraints: BoxConstraints.tight(Size(double.infinity, 38))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text('Password',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -1),),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(15,0,0,12),
                            border: InputBorder.none,
                            hintText: '•••••••',
                            hintStyle: TextStyle(letterSpacing: -1,),
                            constraints: BoxConstraints.tight(Size(double.infinity, 38))
                          ),
                        ),
                      ),
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