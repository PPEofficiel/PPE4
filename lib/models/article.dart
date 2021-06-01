import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  //Articles collection reference
  final CollectionReference article =
      FirebaseFirestore.instance.collection('articles');

  String designation;
  double prixHT;
  int stock;
  String fournisseur;

  Future addArticle(
    String designation,
    int prixHT,
    int stock,
    String fournisseur,
  ) async {
    return await article.add({
      "désignation": designation.toUpperCase(),
      "prix HT": prixHT,
      "stock": stock,
      "Fournisseur": fournisseur.toUpperCase(),
      "id": ''
    }).then((value) {
      print(value.id);
      article.doc(value.id).update({"id": value.id});
    });
  }

  Future<dynamic> readAll() async {
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
    return querySnapshot;
  }

/*   Future<dynamic> readAll() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await FirebaseFirestore.instance
          .collection("articles")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          List t = [result.data()];
         
        });
      });
    } catch (e) {
      print(e);
    }
  }
 */
  void delete(id) async {
    try {
      FirebaseFirestore.instance.collection('articles').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
