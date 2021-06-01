import 'package:cloud_firestore/cloud_firestore.dart';

class Commande {
  //Articles collection reference
  final CollectionReference commande =
      FirebaseFirestore.instance.collection('commandes');

/*   Future addCommande(
    String designation,
    double prixHT,
    int stock,
    int fournisseur,
  ) async {
    return await commande.add({
      "désignation": designation,
      "prix HT": prixHT,
      "stock": stock,
      "Fournisseur": fournisseur,
    });
  }
}
 */

  Future addCommande(List<Map> panier) async {
    return await commande
        .add({"commande": panier, "idcommande": ""}).then((value) {
      commande.doc(value.id).update({"id": value.id});
    });
  }
/* 
  Future ajoutCommandes(String idclient, List<Map> articles) async {
    try {
     
      return await commande
          .collection('articles')
          .add({'articles': articles}).then((value) {
      
      commande.doc(value.id).update({"id": value.id});
    });
    } catch (e) {
      print(e.toString());
    }
  }
 */

  void _update(item, total, article) async {
    try {
      FirebaseFirestore.instance.collection('commandes').doc(item).update({
        'Articles': article,
        'Total': total,
      });
    } catch (e) {
      print(e);
    }
  }

  void delete(item) async {
    try {
      FirebaseFirestore.instance.collection('commandes').doc(item).delete();
    } catch (e) {
      print(e);
    }
  }
}
