import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String text;
  HomePage({this.text});

  @override
  _HomePageState createState() => _HomePageState(check: text);
}

class _HomePageState extends State<HomePage> {
  final passController=TextEditingController();
  void logOut() {
    String email = check;
    String url =
        'http://sanofi.codev.vn/api/user/logout?email';
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
      print(data['status']);
      if (data['statusMessage'] == "Logout Success!") {
        _showdialog();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => CreatePass(
        //             text: email,
        //             veripass: verify,
        //           )),
        // );
      } else{
        _showdialogfail();
      }
    });
  }
void _showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Logout Success!'),
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
  void _showdialogfail() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Logout Failed!'),
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
  final String check;
  _HomePageState({this.check});

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
                          onPressed: () {logOut();},
                          // color: Color.fromRGBO(202, 174, 122, 1),
                          child: Text('LogOut',
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white)),
                        )),
                    // new Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height / 13.5,
                    //   margin: const EdgeInsets.only(
                    //       left: 40, right: 40, bottom: 180),
                    //   child: TextField(
                    //     enabled: false,
                    //     decoration: InputDecoration(
                    //       prefixIcon: Icon(
                    //         Icons.keyboard,
                    //         color: Colors.white,
                    //       ),
                    //       border: OutlineInputBorder(
                    //           borderSide:
                    //               new BorderSide(color: Colors.blue, width: 1),
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(75.0))),
                    //     ),
                    //   ),
                    //   decoration: BoxDecoration(
                    //     boxShadow: [
                    //       new BoxShadow(
                    //         color: Color.fromRGBO(82, 92, 164, 1),
                    //       )
                    //     ],
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    // ),
                    // new Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height / 13.5,
                    //   padding: const EdgeInsets.only(left: 40),
                    //   margin: const EdgeInsets.only(
                    //       left: 40, right: 40, bottom: 180),
                    //   child: TextField(
                    //     controller: passController,
                    //     textAlign: TextAlign.center,
                    //     decoration: InputDecoration(
                    //       hintText: 'Enter Password',
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       border: OutlineInputBorder(
                    //           borderSide:
                    //               new BorderSide(color: Colors.blue, width: 1),
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(75.0))),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
