import 'package:flutter/material.dart';
import 'package:hack2k19sbg/models/navigate.dart';
import 'package:hack2k19sbg/util/options.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final Set<String> _saved = Set<String>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Favorite Categories'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: options == null ? 0 : options.length,
        itemBuilder: (context, i) {
          //Fetch the Options List from options.dart and store each in a Map
          Map option = options[i];
          if (i.isOdd) Divider();
          return _buildEventCategory(option.values.toList()[0]);
        }
      ),

      //Done Floating Button to Save the selected favorite categories
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          //Success Alert after selecting facorite categories
          Alert(
            context: context,
            type: AlertType.success,
            title: "Succeffully added favorite categories",
            buttons: [
              DialogButton(
                onPressed: () {},
                color: Colors.transparent, 
                child: null,
              ),
            ]
          ).show();

          await new Future.delayed(const Duration(seconds: 1));
          
          Navigator.of(context).pop();
          Navigate nav = Navigate(context, "Home");
          nav.navigate("");
          nav = null;
        },
        icon: Icon(Icons.save),
        label: Text("Done"),
      ),
    );
  }

  //Build each event category with a heart icon
  Widget _buildEventCategory(String option) {
    final bool alreadySaved = _saved.contains(option);
    return ListTile(
      title: Text(
        option,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(option);
          } else {
            _saved.add(option);
          }
        });
      },
    );
  }
}
