import 'package:alfostat/core/Classes/UserModel/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCloudServiceUser {
  static CollectionReference<UserModel> getcollectionref() {
    return FirebaseFirestore.instance
        .collection(UserModel.usercollectionname)
        .withConverter(
          fromFirestore: ((snapshot, options) =>
              UserModel.fromfirestore(snapshot.data()!)),

          toFirestore: (data, options) => data.tofirestore(),
        );
  }

  static Future<bool> createuser(UserModel user) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(user.userid);
      await docRef.set(user);

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> updateuser(UserModel user) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(user.userid);
      await docRef.update(user.tofirestore());

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> deleteuser(String userid) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(userid);
      await docRef.delete();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<UserModel ?> getuser(String userid) async {
    final collectionref = getcollectionref();

    final user = await collectionref.doc(userid).get();
    if (!user.exists) {
      return null;
    }
    return user.data();
  }

  static Future<List<UserModel>> getusers(String Buildingnumber) async {
    try {
      final collectionref = getcollectionref();
      final user = await collectionref
          .where("buildingNumber", isEqualTo: Buildingnumber)
          .get();

      return user.docs.map((item) => item.data()).toList();
    } catch (error) {
      return [];
    }
  }

  static Stream<QuerySnapshot<UserModel>> getrealtimeusers() {
    final collectionref = getcollectionref();
    return collectionref.snapshots();
  }

  static Future<bool> isapartmentexist(String buildingnumber,
      String apartmentnumber) async
  {
    final collectionref = getcollectionref();
    final data = await collectionref.where(
        "buildingNumber", isEqualTo: buildingnumber).where(
        "apartmentNumber", isEqualTo: apartmentnumber).get();

    return data.docs.isNotEmpty;
  }

  static Future<bool> updatefcmtoken(String userid, String fcmtoken) async
  {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(userid);
      await docRef.update({"fcmtoken": fcmtoken});

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> setImage(UserModel user, String ? image) async
  {
    final collectionref = getcollectionref();
    final docRef = collectionref.doc(user.userid);
    await docRef.update({"image": image});
  }

  static Future<void> UpdateName(UserModel user, String name) async
  {
    final collectionref = getcollectionref();
    final docRef = collectionref.doc(user.userid);
    await docRef.update({"name": name});
  }

  static Future<void> UpdatePhone(UserModel user, String phone) async
  {
    final collectionref = getcollectionref();
    final docRef = collectionref.doc(user.userid);
    await docRef.update({"phone": phone});
  }

}
