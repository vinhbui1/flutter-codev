import 'package:firt/homePage.dart';
import 'package:firt/resetPass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  final String text;
  Login({this.text});

  @override
  _LoginState createState() => _LoginState(check: text);
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final passController = TextEditingController();
  void getAuth() {
    String email = check;
    String pass = passController.text;
    String url =
        'http://sanofi.codev.vn/api/user/auth?emailLogin&passwordLogin';
    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'emailLogin': email,
      'passwordLogin': pass,
    }).then((response) {
      //print('Response:${response.body}');
      Map<String, dynamic> data;
      var extracdata = json.decode(response.body);
      data = extracdata;
      print(data['statusMessage']);
      print(data['status']);
      if (data['statusMessage'] == "Login Success!") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    text: email,
                  )),
        );
      }
    });
  }

  void reset() {
    String email = check;
    String url = 'http://sanofi.codev.vn/api/user/getcode?email';
    http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'email': email,
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
    String email = check;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResetPass(
                text: email,
              )),
    );
  }

  final String check;
  _LoginState({this.check});

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
                        check,
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
                            getAuth();
                          },
                          // color: Color.fromRGBO(202, 174, 122, 1),
                          child: Text('LogIn',
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
                        obscureText: _obscureText,
                        controller: passController,
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
                          hintText: 'Enter Password',
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
                        padding: const EdgeInsets.only(left: 40),
                        margin: const EdgeInsets.only(left: 80, top: 150),
                        child: new GestureDetector(
                          onTap: () {
                            reset();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPass(
                                        text: check,
                                      )),
                            );
                          },
                          child: new Text("Forgot password"),
                        )),
                        
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
