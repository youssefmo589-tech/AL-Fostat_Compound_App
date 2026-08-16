class AchievementDataModel {
  String title;

  String description;

  static String collectionname = "Achievements";

  String? image;

  String ? AchievementID;

  DateTime ? date;

  AchievementDataModel({
    required this.title,
    required this.description,
    this.image,
    this.date,
    this.AchievementID
  });

  factory AchievementDataModel.fromfirestore(Map<String, dynamic> json) {
    return AchievementDataModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      AchievementID: json["AchievementID"],
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
    );
  }

  Map<String, dynamic> tofirestore() {
    return {"title": title,
      "description": description,
      "image": image,
      "date": date?.millisecondsSinceEpoch,
      "AchievementID": AchievementID,
    };
  }
}
