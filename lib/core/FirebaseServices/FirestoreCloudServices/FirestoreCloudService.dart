import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/AchievementPage/AchieveMentDataModel.dart';

class FireStoreCloudService {
  static CollectionReference<AchievementDataModel> getcollectionref() {
    return FirebaseFirestore.instance
        .collection(AchievementDataModel.collectionname)
        .withConverter(
          fromFirestore: ((snapshot, options) =>
              AchievementDataModel.fromfirestore(snapshot.data()!)),

          toFirestore: (data, options) => data.tofirestore(),
        );
  }

  static Future<bool> createAchievement(
    AchievementDataModel achievement,
  ) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc();
      achievement.AchievementID = docRef.id;
      await docRef.set(achievement);

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> update(AchievementDataModel achievement) async {
    try {
      final collectionref = getcollectionref();
      final docRef = collectionref.doc(achievement.AchievementID);
      await docRef.update(achievement.tofirestore());
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Stream<List<AchievementDataModel>> getrealtimeallachievement() {
    final collectionref = getcollectionref();
    return collectionref.snapshots().map(
      (item) => item.docs.map((doc) => doc.data()).toList(),
    );
  }

  static Future<bool> deleteachievement(String achievementID) async {
    try {
      final collectionref = getcollectionref();

      final docRef = collectionref.doc(achievementID);
      await docRef.delete();

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}
