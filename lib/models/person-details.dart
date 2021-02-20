class PersonDetails {
  PersonDetails({
    this.biography,
    this.birthday,
    this.id,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath
  });

  String biography;
  DateTime birthday;
  int id;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  factory PersonDetails.fromJson(Map<String, dynamic> json) => PersonDetails(
    biography: json["biography"],
    birthday: DateTime.parse(json["birthday"]),
    id: json["id"],
    name: json["name"],
    placeOfBirth: json["place_of_birth"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"],
  );
}