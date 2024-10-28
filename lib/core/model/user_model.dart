class UserModel {
  String uid;
  String name;
  String title;
  String email;
  String imageUrl;
  double progress;
  List<int> favPlanets = [];
  List<double> quizProgress = [];

  UserModel(
      {required this.uid,
      required this.name,
      required this.title,
      required this.email,
      required this.imageUrl,
      required this.progress,
      required this.favPlanets,
      required this.quizProgress});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            uid: json['uid'],
            name: json['name'],
            title: json['title'],
            email: json['email'],
            imageUrl: json['url'],
            progress: json['progress'],
            favPlanets: json['favPlanets'].cast<int>(),
            quizProgress: json['qiuzProgress'].cast<double>());

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "title": title,
      "email": email,
      "url": imageUrl,
      "favPlanets": favPlanets,
      "qiuzProgress": quizProgress,
      "progress": progress
    };
  }
}
