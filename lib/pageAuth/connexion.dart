import 'package:flutter/material.dart';
import 'package:gestcom/services/authentification.dart';
import 'package:gestcom/constant/chargement.dart';

class Connexion extends StatefulWidget {
  final Function changer; // fonction de changement de page
  Connexion({this.changer});
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  String mail = "";
  String mdp = "";
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset('image/867.jpg', height: 200.0, width: 110.0),
                  SizedBox(height: 10.0), // image
                  Center(
                      child: Text(" authentification",
                          style: TextStyle(
                              fontSize: 40,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Colors.blue[700]))),

                  SizedBox(height: 50.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Mail', border: OutlineInputBorder()),
                    validator: (value) =>
                        value.isEmpty ? "Entrez une adresse mail" : null,
                    onChanged: (value) => mail = value,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder()),
                    obscureText: true, // permet de cacher le pwd
                    validator: (value) => value.length < 6
                        ? "Entrez un mot de passe avec 6 ou plus de caractéres"
                        : null,
                    onChanged: (value) => mdp = value,
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic verif =
                              await _authService.connexion(mail, mdp);
                          if (verif != null) {
                            Chargement();
                            widget.changer("accueil");
                          } else {
                            Chargement();
                            print("erreur");
                          }
                        }
                      },
                      child: Text("Connexion"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      )),
                  TextButton(
                    onPressed: () {
                      widget.changer("inscription");
                    },
                    child: Text("Besoin d'un nouveau compte ?"),
                    style: TextButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.black),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
