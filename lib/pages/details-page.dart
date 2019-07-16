import 'package:flutter/material.dart';
import 'package:hack2k19sbg/util/events.dart';


class Details extends StatefulWidget {
  final String event;

  Details({Key key, @required this.event}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState(this.event);
}

class _DetailsState extends State<Details> {
  String event;
  String value;

  _DetailsState(event){
    this.event = event;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          event,
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

      body:  ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: events == null ? 0 : events.length,
              itemBuilder: (BuildContext context, int index) {
              Map event = events[index];

                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "${event["img"]}",
                      height: 250,
                      width: MediaQuery.of(context).size.width-40,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),


          SizedBox(height: 20),

          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Venue",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.0),

              Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.blue[800], style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        onChanged: (String newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                          hint: Text('Select Venue', style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date & Time",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.blue[800], style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        onChanged: (String newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                          hint: Text('Select Performance', style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Price Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.blue[800], style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        onChanged: (String newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                        items: <String>['R100', 'R200', 'R300', 'R400']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                          hint: Text('Select Price', style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Event Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 10),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${events[0]["details"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 10),


            ],
          ),
        ],
      ),

    floatingActionButton: FloatingActionButton(
        child: Text(
          "Buy",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          _buyTicket();
        },
      ),

//      bottomNavigationBar: Container(
//        height: 50,
//        child: RaisedButton(
//          elevation: 15,
//          color: Theme.of(context).primaryColor,
//          child: Text(
//            "See Availability",
//            style: TextStyle(
//              color: Theme.of(context).accentColor,
//            ),
//          ),
//          onPressed: (){},
//        ),
//      ),
    );
  }

  _buyTicket(){
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("Process Payment"),
        actions: <Widget>[
        FlatButton(
          child: Text("No"), 
          onPressed: () {
             _closeDialog();
          },
        ),
        FlatButton(
          child: Text("Yes"), 
          onPressed: () {
             _closeDialog();
             _alertOnly("Successful", "Ticket Purchase was Successful");
          },
        )
      ],
      content: Text("Do you agree that you chose the right event, date and price?"),
      contentPadding: EdgeInsets.all(25.0),
      ),
    );
  }

  _closeDialog(){
    Navigator.of(context).pop();
  }

  _alertOnly(String title, String content){
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: new Text(title),
           actions: <Widget>[
            FlatButton(
              child: Text("Home"), 
              onPressed: () {
                _closeDialog();
                _closeDialog();
              },
            ),
          ],
          content: new Text(content)
      )
    );
  }
}
