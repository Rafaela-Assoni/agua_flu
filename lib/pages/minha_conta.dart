import 'package:controleanimal2/model/Hidratacao.dart';
import 'package:controleanimal2/pages/nova_pessoa.dart';
import 'package:controleanimal2/model/Pessoa.dart';
import 'package:controleanimal2/pages/novo_dado.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controleanimal2/components/menu_inferior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:controleanimal2/pages/novo_dado.dart';

class Minhaconta extends StatefulWidget {
  @override
  _Minhaconta createState() => _Minhaconta();
}

class _Minhaconta extends State<Minhaconta> {

  Firestore db = Firestore.instance;
  String _userID = "";

  Future _getUser() async{
    print("START INIT STATE");
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userID = currentUser.uid;
    });
    print("USER::"+_userID);
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus dados de hidratação"),
      ),

      body: _loadBody(),

      bottomNavigationBar: MenuInferior(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => NewDado()
              )
          );
        },
        tooltip: 'Novo',
        child: Icon(Icons.add),
      ),
    );
  }

  _loadBody(){
    return _userID == ""
        ? Center(
          child: Column(
           children: <Widget>[
             Text("Meus dados de hidratação..."),
             CircularProgressIndicator()
        ],
      ),
    )
        : _body();
  }


  _body() {
    return StreamBuilder(
        stream: db.collection(_userID).document("hidrata").collection("hidrata").snapshots(),
// ignore: missing_return
        builder: (context, snapshot) {
          switch( snapshot.connectionState ) {
            case ConnectionState.none :
            case ConnectionState.done :

            case ConnectionState.waiting :
              return Center(
                child: Column(
                  children: <Widget>[
                    Text("Carregando dados..."),
                    CircularProgressIndicator()
                  ],
                ),
              );
              break;

            case ConnectionState.active :
              QuerySnapshot querySnapshot = snapshot.data;

              if(snapshot.hasError) {
                return Container(
                  child: Text("Ocorreram erros ao carregar os dados!"),
                );
              }
              else {
                print("DADOS CARREGADOS: "+snapshot.data.toString());

                return Container(
                    child: ListView.builder(
                        itemCount: querySnapshot.documents.length,
                        itemBuilder: (context, index) {

                          List<DocumentSnapshot> hidrata = querySnapshot.documents.toList();
                          DocumentSnapshot dados = hidrata[index];

                          Hidratacao hidratacao = Hidratacao(dados["dia"], dados["quantidade"], dados["falta"]);

                          return ListTile(
                            title: Text (hidratacao.dia),
                            subtitle: Text( " Você já ingeriu " + hidratacao.quantidade + "ml" + ","
                                " faltam "+ hidratacao.falta + "ml para atingir a meta."),
                          );
                        }
                    )
                );
              }

          }

        }

    );
  }

}
