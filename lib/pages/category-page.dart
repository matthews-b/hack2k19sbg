import 'package:flutter/material.dart';
import 'package:hack2k19sbg/util/events.dart';
import 'package:hack2k19sbg/widgets/trending-item.dart';

class Category extends StatefulWidget {
  final String category;

  Category({Key key, @required this.category}) : super(key: key);
  
  @override
  _CategoryState createState() => _CategoryState(this.category);
}

class _CategoryState extends State<Category> {
  final TextEditingController _searchControl = new TextEditingController();
  String category;

  _CategoryState(category){
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          category,
          style: TextStyle(
            color: Colors.grey[700]
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Search..",
                    prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[700],
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: Colors.grey[700],
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
              ),
            ),


            SizedBox(height: 10.0),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: events == null ? 0 :events.length,
              itemBuilder: (BuildContext context, int index) {
                Map event = events[index];
                return TrendingItem(
                  img: event["img"],
                  title: event["title"],
                  address: event["address"],
                  price: event["price"],
                  date: event["date"],
                  details: event["details"]
                );
              },
            ),

            SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }
}
