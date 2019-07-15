import 'package:flutter/material.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String date;
  final String price;

  TrendingItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.date,
    @required this.price
  })
    : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.title}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.1),
                        topRight: Radius.circular(0.1),
                      ),
                      child: Image.asset(
                        "${widget.img}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(height: 7.0),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                    child:FlatButton.icon(
                      icon: Icon(Icons.location_on),
                      label:  Text(
                      "${widget.address}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ), onPressed: () {}, 
                    ),
                  ),
              ),

              SizedBox(height: 10.0),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.date}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[ 
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      child: Text(
                        "From R"+"${widget.price}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: RaisedButton(
                      child: Text(
                        "Get Tickets",
                      ),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        /*...*/
                      },
                      
                  )
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
