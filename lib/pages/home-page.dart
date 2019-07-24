import 'package:flutter/material.dart';
import 'package:hack2k19sbg/models/navigate.dart';
import 'package:hack2k19sbg/util/categories.dart';
import 'package:hack2k19sbg/util/locations.dart';
import 'package:hack2k19sbg/util/events.dart';
import 'package:hack2k19sbg/widgets/slide-item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final TextEditingController _searchControl = new TextEditingController();
  String category;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          //Search Bar Card
          child: Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              //Search Textfield
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Search..",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[700],
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                  ),
                ),
                maxLines: 1,
                //Text Controller for search
                controller: _searchControl,
              ),
            ),
          ),
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          60.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            //Trending Events List
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Trending Events",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[700]),
                ),
                FlatButton(
                  child: Text(
                    "More...",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
                    Navigate nav = Navigate(context, "Category");
                    nav.navigate("Multi");
                    nav = null;
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            //Trending Events List Tiles
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: events == null ? 0 : events.length,
                itemBuilder: (BuildContext context, int index) {
                Map event = events[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: event["img"],
                      title: event["title"],
                      address: event["address"],
                      price: event["price"],
                      date: event["date"],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),
            
            //Categories List
            Text(
              "Categories",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[700]),
            ),

            SizedBox(height: 20.0),

            //Categories List Tile
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0 : categories.length,
                itemBuilder: (BuildContext context, int index) {
                Map cat = categories[index];

                  return GestureDetector(
                    onTap: (){
                      Navigate nav = Navigate(context, "Category");
                      nav.navigate(cat["name"]);
                      nav = null;
                      },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              cat["img"],
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.height / 6,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.2, 0.7],
                                  colors: [
                                    cat['color1'],
                                    cat['color2'],
                                  ],
                                  // stops: [0.0, 0.1],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.height / 6,
                            ),
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.height / 6,
                                padding: EdgeInsets.all(1),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    cat["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),

            Text(
              "Locations",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[700]),
            ),

            SizedBox(height: 20.0),

            //Locations List Tiles
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: locations == null ? 0 : locations.length,
                itemBuilder: (BuildContext context, int index) {
                Map cat = locations[index];

                  return GestureDetector(
                    onTap: (){
                      Navigate nav = Navigate(context, "Category");
                      nav.navigate(cat["name"]);
                      nav = null;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              cat["img"],
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.height / 6,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.2, 0.7],
                                  colors: [
                                    cat['color1'],
                                    cat['color2'],
                                  ],
                                  // stops: [0.0, 0.1],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.height / 6,
                            ),
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.height / 6,
                                padding: EdgeInsets.all(1),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    cat["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
