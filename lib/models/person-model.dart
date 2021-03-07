class Person {
  Person({
    this.id,
    this.name,
    this.popularity,
    this.backdropPath
  });

  int id;
  String name;
  double popularity;
  String backdropPath;

  factory Person.fromJson(Map<String, dynamic> json) =>
      Person(
        id: json["id"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        backdropPath: json['profile_path']
      );
}