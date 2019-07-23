import 'package:flutter/material.dart';
import 'package:hack2k19sbg/pages/options-page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password, _errorMessage;
  bool _isIos = false, _isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = SnackBar(
      content: Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Options();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            title: Center(
          child: Text('Login'),
        )),
        body: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      //Logo
                      Hero(
                        tag: 'hero',
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 48.0,
                            child: Image.asset('assets/sbg_logo.png'),
                          ),
                        ),
                      ),

                      //Email Input TextField
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              icon: Icon(
                                Icons.mail,
                                color: Colors.grey,
                              )),
                          validator: (String value) =>
                              value.length < 3 ? 'Email can\'t be empty' : null,
                          onSaved: (value) => _email = value,
                        ),
                      ),

                      //Password Input TextField
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: TextFormField(
                          maxLines: 1,
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              )),
                          validator: (String value) => value.length < 3
                              ? 'Password can\'t be empty'
                              : null,
                          onSaved: (value) => _password = value,
                        ),
                      ),

                      //Submit Button
                      Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: MaterialButton(
                            elevation: 5.0,
                            minWidth: 200.0,
                            height: 42.0,
                            color: Colors.blue,
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            onPressed: _submit,
                          )),

                      //Error Message
                      // (_errorMessage.length > 0 && _errorMessage != null) ?
                      //     Text(
                      //       _errorMessage,
                      //       style: TextStyle(
                      //           fontSize: 13.0,d
                      //           color: Colors.red,
                      //           height: 1.0,
                      //           fontWeight: FontWeight.w300),
                      //     )
                      //   : Container(
                      //       height: 0.0,
                      //     )
                    ],
                  ),
                )),

            //Loading
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(height: 0.0, width: 0.0)
          ],
        ));
  }
}
