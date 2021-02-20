class PersonList{
  PersonList({this.persons});

  final List<dynamic> persons;

  factory PersonList.fromJson(Map<String,dynamic> jsonData){
    return PersonList(
      persons: jsonData['results']
    );
  }
}