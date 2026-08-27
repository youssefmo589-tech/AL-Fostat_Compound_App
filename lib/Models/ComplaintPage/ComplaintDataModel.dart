class ComplaintDataModel {
  String title;

  String? author;

  String description;

  static String collectionname = "Complaints";

  String? image;

  String? complaintID;

  String? userid;

  DateTime? date;

  ComplaintDataModel({
    required this.author,
    required this.title,
    required this.description,
    this.image,
    this.date,
    this.complaintID,
    this.userid,
  });

  factory ComplaintDataModel.fromfirestore(Map<String, dynamic> json) {
    return ComplaintDataModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      complaintID: json["AchievementID"],
      userid: json["userid"],
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
    );
  }

  Map<String, dynamic> tofirestore() {
    return {
      "title": title,
      "description": description,
      "image": image,
      "userid": userid,
      "date": date?.millisecondsSinceEpoch,
      "AchievementID": complaintID,
      "author": author,
    };
  }
}
