import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Client {
  //Clients collection reference
  String idClient = "";
  String nom = "";
  String prenom = "";
  String codePostal = "";
  String ville = "";
  String telephone = "";
  String adresse = "";
  String mail = "";

  final CollectionReference clients =
      FirebaseFirestore.instance.collection('clients');

  Future addClient(String nom, String prenom, String adresse, String codePostal,
      String ville, String telephone, String mail) async {
    return await clients.add({
      "nom": this.nom = nom.toUpperCase(),
      "prenom": this.prenom = prenom.toUpperCase(),
      "adresse": {
        "rue": this.adresse = adresse.toUpperCase(),
        "code postal": this.codePostal = codePostal,
        "ville": this.ville = ville.toUpperCase(),
      },
      "télèphone": this.telephone = telephone,
      "mail": this.mail = mail,
      "id": ""
    }).then((value) {
      clients.doc(value.id).update({"id": value.id});
    });
  }

  dynamic read(String i, String t) async {
    DocumentSnapshot documentSnapshot;

    try {
      documentSnapshot =
          await FirebaseFirestore.instance.collection('clients').doc(i).get();
      dynamic donnee = documentSnapshot.data()[t];
      return donnee;
    } catch (e) {
      print(e.toString());
    }
  }

  void readAll() async {
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

  Future<void> uploadingData(
    String nom,
    String prenom,
  ) async {
    await FirebaseFirestore.instance.collection("client").add({
      "nom": this.nom = nom,
      "prenom": this.prenom = prenom,
    });
  }

  Future<void> editProduct(bool _isFavourite, String id) async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc(id)
        .update({"isFavourite": !_isFavourite});
  }

  Future<void> deleteProduct(DocumentSnapshot doc) async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc(doc.id)
        .delete();
  }

  void delete(id) async {
    try {
      FirebaseFirestore.instance.collection('clients').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
