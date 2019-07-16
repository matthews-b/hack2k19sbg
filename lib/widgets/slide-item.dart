import 'package:flutter/material.dart';
import 'package:hack2k19sbg/pages/details-page.dart';

class SlideItem extends StatefulWidget {

  final String img;
  final String title;
  final String address;
  final String date;
  final String price;

  SlideItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.date,
    @required this.price
  })
      : super(key: key);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  String event;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 6.0),

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

              SizedBox(height: 6.0),

              Container(
                height: MediaQuery.of(context).size.height/3.7,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                    child: Image.asset(
                      "${widget.img}",
                      fit: BoxFit.cover,
                    ),
                ),
              ),

              SizedBox(height: 3.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[ 
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                        child:FlatButton.icon(
                          icon: Icon(Icons.location_on, size: 20, color: Colors.blue[800],),
                          label:  Text(
                          "${widget.address}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[800]
                          ),
                        ), onPressed: () {

                        }, 
                      ),
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
