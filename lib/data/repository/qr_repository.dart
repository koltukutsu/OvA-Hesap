import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/hesap_user.dart';

class QRRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getPeopleAtTable(
    List<String> data,
  ) {
    String restoranId = data[0];
    String masaId = data[1];

    String query = "restoranlar/$restoranId/masalar/$masaId/oturanlar";

    return _firebaseFirestore.collection(query).snapshots();
  }

  sitAtTable(List<String> data, HesapUser hesapUser) {
    String restoranId = data[0];
    String masaId = data[1];

    String query = "restoranlar/$restoranId/masalar/$masaId/oturanlar";

    _firebaseFirestore
        .collection(query)
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'ismi': hesapUser.name,
    });
  }

  leaveTable(List<String> data, HesapUser hesapUser) {
    String restoranId = data[0];
    String masaId = data[1];

    String query = "restoranlar/$restoranId/masalar/$masaId/oturanlar";

    _firebaseFirestore
        .collection(query)
        .doc(_firebaseAuth.currentUser!.uid)
        .delete();
  }
}
