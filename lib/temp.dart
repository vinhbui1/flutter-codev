import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              new Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/pass.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.fromLTRB(0, 380, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 13.5,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Color.fromRGBO(82, 92, 164, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
              ),
              Padding(
                  padding: new EdgeInsets.fromLTRB(0, 380, 0, 0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13.5,
                      margin: const EdgeInsets.only(left: 80, right: 80),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(202, 174, 122, 1),
                        borderRadius: BorderRadius.all(Radius.circular(75)),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Password()),
                          );
                        },
                        // color: Color.fromRGBO(202, 174, 122, 1),
                        child: Text('Register Now',
                            style:
                                TextStyle(fontSize: 23, color: Colors.white)),
                      ))),
              Padding(
                padding: new EdgeInsets.fromLTRB(0, 300, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 14,
                  margin: const EdgeInsets.only(left: 40, right: 40),
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
              ),
              Padding(
                padding: new EdgeInsets.fromLTRB(50, 300, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 14,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
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
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Color.fromRGBO(82, 92, 164, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Container(
                child: new Wrap(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Image.asset('images/icon-user.jpg'),
                    Text('Nguyen van a@gmail.com')
                  ],
                ),
              ),
              Padding(
                padding: new EdgeInsets.fromLTRB(50, 300, 0, 0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 14,
                  child: Image.asset('images/icon-user.jpg'),
                ),
              )
            ],
          )),
    );
  }
}
