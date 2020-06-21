import 'package:controleanimal2/pages/nova_pessoa.dart';
import 'package:controleanimal2/model/Pessoa.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controleanimal2/components/menu_inferior.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Minhaconta extends StatefulWidget {
  @override
  _Minhaconta createState() => _Minhaconta();
}

class _Minhaconta extends State<Minhaconta> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta"),
      ),

      bottomNavigationBar: MenuInferior(),

      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Voltar',
        child: Icon(Icons.arrow_back),
      ),*/
    );
  }
}
