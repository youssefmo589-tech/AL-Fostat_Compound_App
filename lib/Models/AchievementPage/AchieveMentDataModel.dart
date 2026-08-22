class AchievementDataModel {
  String title;

  String ? author;

  String description;

  static String collectionname = "Achievements";

  String? image;

  String ? AchievementID;

  String ? userid;


  DateTime ? date;

  AchievementDataModel({
    required this.author,
    required this.title,
    required this.description,
    this.image,
    this.date,
    this.AchievementID,
    this.userid
  });

  factory AchievementDataModel.fromfirestore(Map<String, dynamic> json) {
    return AchievementDataModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      AchievementID: json["AchievementID"],
      userid: json["userid"],
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
    );
  }

  Map<String, dynamic> tofirestore() {
    return {"title": title,
      "description": description,
      "image": image,
      "userid": userid,
      "date": date?.millisecondsSinceEpoch,
      "AchievementID": AchievementID,
      "author": author,
    };
  }
}
