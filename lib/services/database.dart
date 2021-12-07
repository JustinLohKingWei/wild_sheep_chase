import 'package:cloud_firestore/cloud_firestore.dart';

class dataBaseService {
  final String uid;
  dataBaseService({this.uid});
  final CollectionReference drinkCollection = FirebaseFirestore.instance
      .collection('drinks'); // Changed Firestore class to FirebaseFirestore

  Future updateUserData(
      String name, String drinkName, int sugarLevel, String toppings) async {
    return await drinkCollection.doc(uid).set({
      'name': name,
      'drinkName': drinkName,
      'sugarLevel': sugarLevel,
      'toppings': toppings,
    }); //Changed document() method to doc(), changed setData to set().
  }
}
