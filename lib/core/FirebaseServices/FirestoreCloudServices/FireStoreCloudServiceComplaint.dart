import 'package:alfostat/Models/ComplaintPage/ComplaintDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCloudServiceComplaint {
  static CollectionReference<ComplaintDataModel> getcollectionref() {
    return FirebaseFirestore.instance
        .collection(ComplaintDataModel.collectionname)
        .withConverter(
          fromFirestore: ((snapshot, options) =>
              ComplaintDataModel.fromfirestore(snapshot.data()!)),

          toFirestore: (data, options) => data.tofirestore(),
        );
  }

  static Future<bool> createComplaint(ComplaintDataModel complaint) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc();
      complaint.complaintID = docRef.id;
      await docRef.set(complaint);

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> update(ComplaintDataModel complaint) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(complaint.complaintID);
      await docRef.update(complaint.tofirestore());
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Stream<List<ComplaintDataModel>> getrealtimeallcomplaint() {
    final collectionref = getcollectionref();
    return collectionref.snapshots().map(
      (item) => item.docs.map((doc) => doc.data()).toList(),
    );
  }

  static Future<bool> deletecomplaint(String complaintID) async {
    try {
      final collectionref = getcollectionref();

      final docRef = collectionref.doc(complaintID);
      await docRef.delete();

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}
