import 'package:controleanimal2/pages/login.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100, left: 30, right: 30),
                child:
                Image.asset(
                    "assets/images/logo.png"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80, left: 30, right: 30),
                child:
                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)
                        ),
                        child: Text('LOGIN',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => Login()
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 95, bottom: 100),
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Container(
                        child: Text(
                          "Smart Watter Bottle",
                          textAlign: TextAlign.right,

                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 30,
                              color: Colors.white.withOpacity(0.7)),
                        )
                    ),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
