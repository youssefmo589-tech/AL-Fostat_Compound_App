class AchievementDataModel {
  String title;

  String description;

  String? image;

  AchievementDataModel({
    required this.title,
    required this.description,
    this.image,
  });

  factory AchievementDataModel.fromfirestore(Map<String, dynamic> json) {
    return AchievementDataModel(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> tofirestore() {
    return {"title": title, "description": description, "image": image};
  }
}
