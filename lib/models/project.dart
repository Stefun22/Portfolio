class Project {
  final String title;
  final List<String> description;
  final String company;
  final int order;
  String? appUrl;

  Project(
      {required this.title,
      required this.description,
      required this.company,
      required this.order,
      this.appUrl});

  static fromJson(Map<String, dynamic> json) {
    return Project(
        title: json["title"],
        order: json["order"],
        company: json["company"],
        appUrl: json["appUrl"],
        description: List<String>.from(json["description"]));
  }
}
