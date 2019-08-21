import 'package:flutter/material.dart';
import './password.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _text = TextEditingController();
  bool _validate = false;

  String _email;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void _submitCommand() {
    String email = _text.text;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(_email))
      return _showdialog();
    else
      Navigator.push(
        context,MaterialPageRoute(builder: (context)=> Password()),
      );
  }

  void _showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Enter Valid Email'),
            actions: <Widget>[
              new FlatButton(
                child: Text('oke'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/sanofi.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(82, 92, 164, 1),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                    new Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13.5,
                        margin: const EdgeInsets.only(left: 80, right: 80),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(202, 174, 122, 1),
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                        ),
                        child: FlatButton(
                          onPressed: _submitCommand,
                          color: Color.fromRGBO(202, 174, 122, 1),
                          child: Text('Continue',
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white)),
                        )),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 180),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75.0))),
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromRGBO(82, 92, 164, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      padding: const EdgeInsets.only(right: 40),
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 180),
                      child: TextFormField(
                        controller: _text,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75.0))),
                        ),
                        validator: (String arg) {
                          if (arg.length == null)
                            return 'Email can not null';
                          else
                            return null;
                        },
                        onSaved: (String val) {
                          _email = val;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
