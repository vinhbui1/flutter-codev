import 'package:firt/Login.dart';
import 'dart:async';
import './createPass.dart';

import 'package:flutter/material.dart';
import './register.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  void loginData() {
    String email = _text.text;
    String url = 'http://sanofi.codev.vn/api/user/checkmail?emai';

    http.post(url,
        headers: {'Accept': 'application/json'},
        body: {'emailLogin': email}).then((response) {
      //print('Response:${response.body}');
      Map<String, dynamic> data;
      var extracdata = json.decode(response.body);
      data = extracdata;
      print(data['statusMessage']);
      print(data['data']['email']);
      if (data['statusMessage'] == "User found!") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Login(
                    text: email,
                  )),
        );
      } else {
        //   String email = _text.text;
        //   String url = 'http://sanofi.codev.vn/api/user/getcode?email';
        //   http.post(url,
        //       headers: {'Accept': 'application/json'},
        //       body: {'email': email}).then((response) {
        //     //print('Response:${response.body}');
        //     Map<String, dynamic> data;
        //     var extracdata = json.decode(response.body);
        //     data = extracdata;
        //     print(data['statusMessage']);
        //     print(data['data']);
        //     if (data['statusMessage'] == "Get code Success") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Password(
                    text: email,
                  )),
        );
        //     }
        //   });
      }
    });
  }

  final _text = TextEditingController();
  bool _validate = false;

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
    if (!regex.hasMatch(email)) return _showdialog();
  }

  void _showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(202, 174, 122, 1),
            contentTextStyle: TextStyle(fontFamily: 'Schyler'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
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
              fit: BoxFit.fill,
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

                    // new Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height / 13.5,
                    //   padding: const EdgeInsets.only(right: 40),
                    //   margin: const EdgeInsets.only(
                    //       left: 40, right: 40, bottom: 180),
                    //   // child: TextFormField(
                    //   //   controller: _text,
                    //   //  // textAlign: TextAlign.center,
                    //   //  // keyboardType: TextInputType.emailAddress,
                    //   //   decoration: InputDecoration(
                    //   //     labelText: 'Email Address',
                    //   //     errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    //   //     filled: true,
                    //   //     fillColor: Colors.white,
                    //   //     border: OutlineInputBorder(
                    //   //         borderRadius:
                    //   //             BorderRadius.all(Radius.circular(75.0))),
                    //   //   ),
                    //   //   validator: (String arg) {
                    //   //     if (arg.length == null)
                    //   //       return 'Email can not null';
                    //   //     else
                    //   //       return null;
                    //   //   },
                    //   // ),
                    // ),

                    new Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13.5,
                        margin: const EdgeInsets.only(left: 80, right: 80),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(202, 174, 122, 1),
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            _submitCommand();
                            loginData();
                            // create();
                          },
                          // color: Color.fromRGBO(202, 174, 122, 1),
                          child: Text('Continue',
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white)),
                        )),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 200),
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
                        color: Color.fromRGBO(82, 92, 164, 1),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 200),
                      child: TextField(
                        controller: _text,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
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
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
