import 'package:firt/createPass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Password extends StatefulWidget {
  final String text;
  Password({this.text});

  @override
  _PasswordState createState() => _PasswordState(email: text);
}

class _PasswordState extends State<Password> {

  final enterCode = TextEditingController();
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
  void getCode() {
    String verify = enterCode.text;
    String url = 'http://sanofi.codev.vn/api/user/checkcode?email&verify_code';
    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'email': email,
      'verify_code': verify,
    }).then((response) {
      //print('Response:${response.body}');
      Map<String, dynamic> data;
      var extracdata = json.decode(response.body);
      data = extracdata;
      print(data['statusMessage']);
      print(data['status']);
      if (data['statusMessage'] == "Check code Success!") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreatePass(
                    text: email,
                    veripass: verify,
                  )),
        );
      } else {
        _showdialog();
      }
    });
  }

  void _showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Pleas Check Your Code'),
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

  final String email;
  _PasswordState({this.email});

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
                          onPressed: () {
                            getCode();
                          },
                          // color: Color.fromRGBO(202, 174, 122, 1),
                          child: Text('Register Now',
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
                      padding: const EdgeInsets.only(left: 40),
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, bottom: 180),
                      child: TextField(
                        controller: enterCode,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Enter Code',
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
