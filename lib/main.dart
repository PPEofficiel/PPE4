import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestcom/models/commandes.dart';
import 'package:gestcom/pageAuth/accueil.dart';
import 'package:gestcom/pageAuth/inscription.dart';
import 'package:gestcom/pageAuth/liaison.dart';
import 'package:gestcom/pageCrud/accueil_admin.dart';
import 'package:gestcom/pageCrud/ajoutClient.dart';
import 'package:gestcom/pageCrud/formulaireArticle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pageAuth/liaison.dart';
import 'pageCrud/accueil_admin.dart';
import 'pageCrud/accueil_admin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // base pour se connecté à firebase
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyApp",
      theme: ThemeData(primarySwatch: Colors.blue // théme de l'application
          ),
      debugShowCheckedModeBanner: false, // désactive le bandeau
      home: AccScreen(), // page index
      //home: MyHomePage(), // page index
    );
  }
}

// Création de l'objet index----------------------------------------------
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List panier = [];
  void _create() async {
    try {
      await firestore.collection("users").add({
        "name": "john",
        "age": 50,
        "email": "example@example.com",
        "address": {"street": "street 24", "city": "new york"},
        "id": ""
      }).then((value) {
        print(value.id);
        firestore.collection("users").doc(value.id).update({"id": value.id});
      });
    } catch (e) {
      print(e);
    }
  }

  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await firestore.collection('users').doc('mS8Vv1JMcGVRCO6viP6o').get();

      print(documentSnapshot.data()['name']);
    } catch (e) {
      print(e);
    }
  }

/*   Future<dynamic> _readAll() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection("articles").get();
      querySnapshot.docs.map((result) {
        print(result.data());
        return result.data();
      });
    } catch (e) {
      print(e);
    }
    print(querySnapshot);
  }
 */
/*   void _readAll() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await FirebaseFirestore.instance
          .collection("clients")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          print(result.data());
        });
      });
    } catch (e) {
      print(e);
    }
  }
 */
/* 
  Future<dynamic> _readAll() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await FirebaseFirestore.instance
          .collection("articles")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          List t = [result.data()];
          print(t);
        });
      });
    } catch (e) {
      print(e);
    }
  }
 */
  Future<dynamic> _readAll() async {
    dynamic querySnapshot;
    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection("articles").get();
      querySnapshot = querySnapshot.docs.map((result) {
        return result.data();
      }).toList();
    } catch (e) {
      print(e);
    }
    print(querySnapshot);
    return querySnapshot;
  }

/*   void _readAll() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await firestore.collection("clients").get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          print(result.data());
        });
      });
    } catch (e) {
      print(e);
    }
  }
 */

  void _sous() async {
    try {
      FirebaseFirestore.instance
          .collection("clients")
          .doc("FwaXNussm78nTFGlofgP")
          .collection("commandes")
          .add({"petName": "test1", "petType": "dog", "petAge": 1});
    } catch (e) {
      print(e);
    }
  }

  void _update() async {
    try {
      firestore.collection('users').doc('testUser').update({
        'firstName': 'Alan',
      });
    } catch (e) {
      print(e);
    }
  }

  void _delete() async {
    try {
      firestore.collection('users').doc('9sZVebJb4WlkuKjjLqJe').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CRUD with Firebase"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Create"),
                onPressed: _create,
              ),
              RaisedButton(
                child: Text("Read"),
                onPressed: _read,
              ),
              RaisedButton(
                child: Text("ReadAll"),
                onPressed: _readAll,
              ),
              RaisedButton(
                child: Text("Update"),
                onPressed: _update,
              ),
              RaisedButton(
                child: Text("Delete"),
                onPressed: _delete,
              ),
              RaisedButton(
                child: Text("sous"),
                onPressed: _sous,
              ),
            ]),
      ),
    );
  }
}
