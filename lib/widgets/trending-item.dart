import 'package:flutter/material.dart';
import 'package:hack2k19sbg/pages/details-page.dart';

class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String date;
  final String price;
  final String details;

  TrendingItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.date,
    @required this.price,
    @required this.details
  })
    : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  String event;
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
                      color: Colors.grey[700]
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
                      icon: Icon(Icons.location_on, color: Colors.blue[800],),
                      label:  Text(
                      "${widget.address}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800]
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
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[800]
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
                      child: Row(
                        children: <Widget>[
                          Text(
                            "From:",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[800]
                            ),
                          textAlign: TextAlign.left,
                          ),
                          
                          Text(
                            " R"+"${widget.price}",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue[800]
                            ),
                          textAlign: TextAlign.left,
                          ),
                        ],)
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: RaisedButton(
                      child: Text(
                        "Get Tickets",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.blue[800],
                      onPressed: () {
                        event = "${widget.title}";
                        _eventDetails();
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
  void _eventDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Details(event: event);
        },
      ),
    );
  }

}
