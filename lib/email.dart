import 'package:flutter/material.dart';
import './password.dart';
class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Password()),
                        );
                      },
                      // color: Color.fromRGBO(202, 174, 122, 1),
                      child: Text('Continue',
                          style: TextStyle(fontSize: 23, color: Colors.white)),
                    )),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 13.5,
                  margin:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 180),
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
                  margin:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 180),
                  child: TextField(
                    textAlign: TextAlign.center,
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
