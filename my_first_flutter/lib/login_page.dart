import 'package:flutter/material.dart';
import './invoice_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginWidget createState() => LoginWidget();
}

class LoginWidget extends State<LoginPage> {
  //  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _username;
  String _password;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: new Center(
        child: new Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: loginUI(),
        ),
      ),
    );
  }

  Widget loginUI() {
    return new ListView(
      shrinkWrap: true,
      padding: new EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        SizedBox(height: 20),
        _userNameFeild(),
        SizedBox(height: 20),
        _passwordFeild(),
        Padding(
          padding: new EdgeInsets.symmetric(vertical: 16.0),
          child: new RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(24),
            ),
            padding: new EdgeInsets.all(12),
            color: Colors.blue,
            onPressed: _validateLogin,
            child: new Text('Log In', style: new TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  TextFormField _userNameFeild() {
    return new TextFormField(
      //maxLength: 10,
      keyboardType: TextInputType.text,
      autofocus: true,
      validator: (String arg) {
        if (arg.isEmpty) {
          return 'Please Enter the Username';
        }
        if ('waplak'.toUpperCase() != arg.toUpperCase())
          return 'Incorrect Username';
        else
          return null;
      },
      onSaved: (String val) {
        _username = val;
      },
      decoration: new InputDecoration(
        hintText: 'Username',
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(32.0)),
      ),
    );
  }

  TextFormField _passwordFeild() {
    return new TextFormField(
      //maxLength: 10,
      autofocus: false,
      obscureText: true,
      validator: (String arg) {
        if (arg.isEmpty) {
          return 'Please Enter the Password';
        }
        if ('pamitha99' != arg)
          return 'Incorrect Password';
        else
          return null;
      },
      onSaved: (String val) {
        _password = val;
      },
      decoration: new InputDecoration(
        hintText: 'Password',
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder(borderRadius:new BorderRadius.circular(32.0)),
      ),
    );
  }

  void _validateLogin() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new InvoiceScreen()),
      );
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
