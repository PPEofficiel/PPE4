import 'package:flutter/material.dart';
import 'package:gestcom/pageAuth/Inscription_auth.dart';
import 'package:gestcom/pageAuth/login.dart';

class AccScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const AccScreen({
    Key key,
    this.onChangedStep,
  }) : super(key: key);

  @override
  _AccScreenState createState() => _AccScreenState();
}

class _AccScreenState extends State<AccScreen> {
  bool _auth = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* Image.asset('img/appli.png', height: 200.0, width: 300.0), */
                RichText(
                  text: TextSpan(
                    text: 'Bienvenue dans\n'.toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                    children: [
                      TextSpan(
                        text: "l'application\n".toUpperCase(),
                      ),
                      TextSpan(
                          text: "GESTCOM\n",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Veuillez-acceder à la page de connexion",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  child: Column(
                    children: [
                      RaisedButton(
                          child: Text(
                            "Se connecter".toUpperCase(),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }),
                      SizedBox(
                        height: 30.0,
                      ),
                      RaisedButton(
                          child: Text(
                            "Inscription".toUpperCase(),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InscriptionScreen()));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
