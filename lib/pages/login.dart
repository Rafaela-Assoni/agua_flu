import 'package:controleanimal2/model/Usuario.dart';
import 'package:controleanimal2/pages/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  String _erroMsg = "";

  _validacao() {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (email.isNotEmpty || senha.isNotEmpty) {
      if (!email.contains("@")) {
        setState(() {
          _erroMsg = "Informe um email válido !";
        });
      }
      else if (!(senha.length > 6)) {
        setState(() {
          _erroMsg = "Senha deve ter mais de 6 caracteres !";
        });
      }
      else {
        setState(() {
          _erroMsg = "";
        });

        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;

        _entrar(usuario);
      }
    }
    else {
      setState(() {
        _erroMsg = "Preencha todos os campos";
      });
    }
  }


  _entrar(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser) {

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      print("Erro retornado do Firebase: "+error.toString());
      setState(() {
        _erroMsg = "Erro ao tentar entrar !";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomPadding: false,
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage (
            image: AssetImage("assets/images/fundo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80, left: 30, right: 30),
              child:
              Image.asset(
                  "assets/images/logo.png"
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 30, right: 30),
              child:
              TextField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(50.0),
                    ),
                  ),
                  contentPadding: new EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),

                  filled: true,
                  fillColor: Colors.white70,

                  alignLabelWithHint: true,
                  labelText: 'E-mail',
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child:
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(50.0),
                    ),
                  ),
                  contentPadding: new EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),

                  filled: true,
                  fillColor: Colors.white70,

                  alignLabelWithHint: true,
                  labelText: "Senha",
                ),
                controller: _senhaController,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child:
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 150,
                    child:
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                      ),
                      child: Text('CADASTRAR',
                        style: TextStyle (
                            fontFamily: 'Oswald',
                            color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => Cadastro()
                            )
                        );
                      },
                    ),
                  ),

                  Container(
                    width: 150,
                    child:
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide (color: Colors.white)
                      ),
                      child: Text('ENTRAR',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        _validacao();
                      },
                    ),
                  ),
                ],
              ),
            ),
            OutlineButton(
              child: Text('Esqueci a senha',
                style: TextStyle (
                  fontFamily: 'Oswald',
                  color: Colors.white,
                ),
              ),
              onPressed: () {/** */},
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Text(
                _erroMsg,
                style: TextStyle(color: Colors.white, fontSize: 20 ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 40, bottom: 60),
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Container(
                    child: Text(
                      "Smart Watter Bottle",
                      textAlign: TextAlign.right,

                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 26,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

