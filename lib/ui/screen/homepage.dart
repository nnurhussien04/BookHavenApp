import 'dart:ui' as ui;

import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:bookhaven/ui/widgets/homepage_content.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  var imageURLs = List.generate(10, (i) => 'https://covers.openlibrary.org/b/id/240727-L.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F6),
      appBar: BookhavenBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20,60,20,20),
          //margin: EdgeInsets.all(10),
          child: Column(
            spacing: 20,
            children: [
              HomepageContent(),
              SizedBox(height: 60),
              Row(
                spacing: 4.0,
                children: [
                Icon(Icons.trending_up),
                Text('Featured Books',style: Theme.of(context).textTheme.headlineMedium),
                ]
              ),
              GridView.builder(
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), //Stops 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5
                ),
                itemCount: imageURLs.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 260,
                          width: double.infinity,
                          child: Image.network(
                            fit: BoxFit.fill,
                            imageURLs[index],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: -1),),
                              Text('Author',style: TextStyle(letterSpacing: -1,color: Colors.black54,fontWeight: FontWeight.w500),),
                              Row(children: [Icon(Icons.star,size: 14,), SizedBox(width: 2) ,Text('0.0'), Spacer(),Container(padding: EdgeInsets.symmetric(horizontal: 4,vertical: 0),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xFFEBE5DD)), child: Text('Genre',style: TextStyle(fontSize: 12),))]),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}