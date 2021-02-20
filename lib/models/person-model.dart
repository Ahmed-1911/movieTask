class Person {
  Person({
    this.id,
    this.name,
    this.popularity,
    this.backdrop_path
  });

  int id;
  String name;
  double popularity;
  String backdrop_path;

  factory Person.fromJson(Map<String, dynamic> json) =>
      Person(
        id: json["id"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        backdrop_path: json['profile_path']
      );
}