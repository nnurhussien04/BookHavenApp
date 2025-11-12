import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:flutter/material.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageURLs = List.generate(10, (i) => 'https://covers.openlibrary.org/b/id/240727-L.jpg');
    return Scaffold(
      appBar: BookhavenBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text('Browse Books',style: Theme.of(context).textTheme.headlineLarge,),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFE6DFD6),
                        width: 1.0
                      )
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 0),
                        prefixIcon: Icon(Icons.search,color: Colors.black45,),
                        hintStyle: TextStyle(
                          letterSpacing: -1,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500
                        ),
                        hintText: 'Search by title or author...'
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  FilterDropDown(),
                  SizedBox(height: 15),
                  GridView.builder(
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
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              spacing: 2,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: -1),),
                                Text('Author',style: TextStyle(letterSpacing: -1,color: Colors.black54,fontWeight: FontWeight.w500),),
                                Row(children: [Icon(Icons.star,size: 14), SizedBox(width: 2) ,Text('0.0',style: TextStyle(fontWeight: FontWeight.w600),), Spacer(),Container(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xFFFFFBF5)), child: Text('Genre',style: TextStyle(fontSize: 12),))]),
                              ],
                            ),
                          ),
                          Center(child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.favorite_outline) ,label: Text('Add to Favourites',style: TextStyle(fontSize: 13,letterSpacing: -1,wordSpacing: 1,fontWeight: FontWeight.w600))))  
                        ],
                      ),
                    );
                  },
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterDropDown extends StatelessWidget {
  const FilterDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      textStyle: TextStyle(
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w500
      ),
      initialSelection: 'All Categories',
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
      dropdownMenuEntries: ['All Categories','Science Fiction','Classic Fiction','Fantasy','Romance','Fiction'].map((x) => DropdownMenuEntry(value: x, label: x)).toList()
    );
  }
}