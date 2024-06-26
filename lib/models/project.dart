class Project {
  final String title;
  final List<String> description;
  final String company;
  final int order;

  Project({
    required this.title,
    required this.description,
    required this.company,
    required this.order,
  });

  static fromJson(Map<String, dynamic> json) {
    return Project(
        title: json["title"],
        order: json["order"],
        company: json["company"],
        description: List<String>.from(json["description"]));
  }
}
