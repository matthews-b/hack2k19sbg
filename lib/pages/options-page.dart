import 'package:flutter/material.dart';
import 'package:hack2k19sbg/pages/home-page.dart';
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
          Map option = options[i];
          if (i.isOdd) Divider();
          return _buildRow(option.values.toList()[0]);
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Alert(
            context: context,
            type: AlertType.success,
            title: "Done",
            buttons: [
              DialogButton(
                child: Icon(Icons.done),
                onPressed: () => Navigator.pop(context),
                color: Colors.green
              ),
            ]
          ).show();

          await new Future.delayed(const Duration(seconds: 1));
          
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Home();
              },
            ),
          );
        },
        icon: Icon(Icons.save),
        label: Text("Done"),
      ),
    );
  }

  // #docregion _buildRow
  Widget _buildRow(String option) {
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

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String option) {
              return ListTile(
                title: Text(
                  option,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Categories'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
