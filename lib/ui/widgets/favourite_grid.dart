import 'package:flutter/material.dart';

class FavouritesGrid extends StatelessWidget {
  const FavouritesGrid({
    super.key,
    required this.imageURLs
  });

  final List<String> imageURLs;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    clipBehavior: Clip.hardEdge,
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(), //Stops 
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.46,
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
              padding: const EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
              child: Column(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: -1),),
                  Text('Author',style: TextStyle(letterSpacing: -1,color: Colors.black54,fontWeight: FontWeight.w500),),
                  Row(children: [Icon(Icons.star,size: 14), SizedBox(width: 2) ,Text('0.0',style: TextStyle(fontWeight: FontWeight.w600),), Spacer(),Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xFFFFFBF5)), child: Text('Genre',style: TextStyle(fontSize: 12),))]),
                ],
              ),
            ),
            Center(child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.favorite_outline) ,label: Text('Add to Favourites',style: TextStyle(fontSize: 13,letterSpacing: -1,wordSpacing: 1,fontWeight: FontWeight.w600))))  
          ],
        ),
      );
    },
                    );
  }
}