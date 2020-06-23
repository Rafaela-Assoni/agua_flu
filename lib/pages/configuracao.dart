import 'package:controleanimal2/pages/nova_pessoa.dart';
import 'package:controleanimal2/model/Pessoa.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controleanimal2/components/menu_inferior.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Configurações"),
      ),

      bottomNavigationBar: MenuInferior(),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80, left: 80, right: 80),
            child:
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 500,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)
                    ),
                    child: Text('TROCAR DE SENHA',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 20,
                          color: Colors.blue
                      ),
                    ),
                    onPressed: () {
                      /* */
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 80, right: 80),
            child:
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 500,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)
                    ),
                    child: Text('MUDAR EMAIL',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 20,
                          color: Colors.blue
                      ),
                    ),
                    onPressed: () {
                      /* */
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 80, right: 80),
            child:
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 500,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)
                    ),
                    child: Text('EXCLUIR CONTA',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 20,
                          color: Colors.blue
                      ),
                    ),
                    onPressed: () {
                      /* */
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 80, right: 80),
            child:
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 500,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)
                    ),
                    child: Text('SAIR',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 20,
                          color: Colors.blue
                      ),
                    ),
                    onPressed: () {
                      /* */
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )

    );
  }
}
