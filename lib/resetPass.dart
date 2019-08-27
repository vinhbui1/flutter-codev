import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './homePage.dart';
import 'dart:convert';

class ResetPass extends StatefulWidget {
  final String text;

  ResetPass({@required this.text});

  @override
  _ResetPassState createState() => _ResetPassState(email: text);
}

class _ResetPassState extends State<ResetPass> {
  void reset() {
    String emailuser = email;
    String url = 'http://sanofi.codev.vn/api/user/resend_code?email';
    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'email': emailuser,
    }).then((response) {
      //print('Response:${response.body}');
      Map<String, dynamic> data;
      var extracdata = json.decode(response.body);
      data = extracdata;
      print(data['statusMessage']);
      print(data['data']);
    });
  }

  void resetpass() {
    String emailUser = email.toString();
    String pass = newpass.text;
    String passcf = renewpass.text;
    String very = verify.text;
    String url =
        'http://sanofi.codev.vn/api/user/changepassword?emailLogin&passwordLogin&passwordConfirmed&verify_code';
    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'emailLogin': emailUser,
      'passwordLogin': pass,
      'passwordConfirmed': passcf,
      'verify_code': very,
    }).then((response) {
      //print('Response:${response.body}');
      Map<String, dynamic> data;
      var extracdata = json.decode(response.body);
      data = extracdata;
      print(data['statusMessage']);
      print(data['data']);
      if (data['statusMessage'] == "Change Password Success!") {
        _showdialog();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    text: email,
                  )),
        );
      } else {
        _showdialogfail();
      }
    });
  }

  void _showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Login Succesful'),
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

  bool _obscureText = true;

  void _toggle( ) {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _showdialogfail() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Login Fails'),
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

  final verify = TextEditingController();
  final newpass = TextEditingController();
  final renewpass = TextEditingController();

  final String email;

  _ResetPassState({this.email});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/pass.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    //color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("images/icon-user.jpg"),
                    ),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        email,
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
                    )
                  ],
                ),
                new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, top: 100),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(82, 92, 164, 1),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                    new Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13.5,
                        margin: const EdgeInsets.only(
                            left: 80, right: 80, top: 100),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(202, 174, 122, 1),
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            resetpass();
                          },
                          // color: Color.fromRGBO(202, 174, 122, 1),
                          child: Text('Reset Pass',
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
                          prefixIcon: Icon(
                            Icons.keyboard,
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
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 60),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.keyboard,
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
                      padding: const EdgeInsets.only(left: 40),
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 180),
                      child: TextField(
                        obscureText: _obscureText,
                        controller: newpass,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              _toggle();
                            },
                            icon: Image.asset(_obscureText
                                ? 'images/show.png'
                                : 'images/hide.png'),
                            color: Colors.white,
                            iconSize: 10,
                          ),
                          hintText: 'New Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75.0))),
                        ),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      padding: const EdgeInsets.only(left: 40),
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 60),
                      child: TextField(
                        obscureText: _obscureText,
                        controller: renewpass,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              _toggle();
                            },
                            icon: Image.asset(_obscureText
                                ? 'images/show.png'
                                : 'images/hide.png'),
                            color: Colors.white,
                            iconSize: 10,
                          ),
                          hintText: 'Re-New Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75.0))),
                        ),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 300),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.keyboard,
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
                      padding: const EdgeInsets.only(left: 40),
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 300),
                      child: TextField(
                        controller: verify,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Code',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75.0))),
                        ),
                      ),
                    ),
                    new Container(
                        //  width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13.5,
                        padding: const EdgeInsets.only(left: 80),
                        margin: const EdgeInsets.only(left: 80, top: 240),
                        child: new GestureDetector(
                          onTap: () {
                            reset();
                          },
                          child: new Text("ReSend Code"),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
