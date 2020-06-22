import 'package:controleanimal2/pages/nova_pessoa.dart';
import 'package:controleanimal2/model/Pessoa.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controleanimal2/components/menu_inferior.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text("Meus Amigos"),
      ),

      body: _loadBody(),

      bottomNavigationBar: MenuInferior(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => NovaPessoa()
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
              Text("Carregando amigos..."),
              CircularProgressIndicator()
             ],
        ),
      )
    : _body();
  }

_body() {
    return StreamBuilder(
        stream: db.collection(_userID()).document("pessoas").collection("pessoas").snapshots(),
// ignore: missing_return
        builder: (context, snapshot) {
          switch( snapshot.connectionState ) {
            case ConnectionState.none :
            case ConnectionState.done :

            case ConnectionState.waiting :
              return Center(
                child: Column(
                  children: <Widget>[
                    Text("Carregando pessoas..."),
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
                          //recupera as pessoas
                          List<DocumentSnapshot> pessoas = querySnapshot.documents.toList();
                          DocumentSnapshot dados = pessoas[index];

                          Pessoa pessoa = Pessoa(dados["nome"], dados["idade"], dados["profissao"], dados["foto"]);

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(pessoa.foto),
                            ),
                            title: Text( pessoa.nome ),
                            subtitle: Text( pessoa.profissao + ", " + pessoa.idade + " anos."),
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
