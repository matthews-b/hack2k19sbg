import 'package:flutter/material.dart';
import 'package:hack2k19sbg/pages/home-page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Home(),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width:7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: Colors.blueGrey,
              onPressed: (){

              },
            ),

            IconButton(
              icon:Icon(
                Icons.label,
                size: 24.0,
              ),
              color: Colors.blueGrey,
              onPressed: () {

              },
            ),

            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 24.0,
              ),
              color: Colors.blueGrey,
              onPressed: (){

              },
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: Colors.blueGrey,
            onPressed: (){
              
            },
            ),

            SizedBox(width:7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
    );
  }

}
