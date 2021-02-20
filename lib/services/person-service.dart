import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_task/models/person-details.dart';
import 'package:movie_task/models/person-list.dart';
import 'package:movie_task/models/person-model.dart';

class PersonApi{
  String apiKey='5748c9cc927b2d946e4d0c007bb63972';
  List<Person> personList=[];
  Future<List<Person>> fetchPersonsData() async {
    try {
      for(int i = 1 ; i< 10 ; i++) {
        var url = 'https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=en-US&page=$i';
        final response = await http.get(url);
        final extractedData = json.decode(response.body);
        if (response.statusCode == 200) {
          PersonList pList = PersonList.fromJson(extractedData);
          personList.addAll(pList.persons.map((e) => Person.fromJson(e)).toList());
        }
        else {
          print(response.statusCode);
          return null;
        }
      }
      return personList;
    }
    catch (e) {
      print(e);
      return null;
    }
  }


  //person Details
  fetchPersonDetails(personId) async {
    try {
        var url = 'https://api.themoviedb.org/3/person/$personId?api_key=$apiKey&language=en-US';
        final response = await http.get(url);
        final extractedData = json.decode(response.body);
        if (response.statusCode == 200) {
          PersonDetails pDetails = PersonDetails.fromJson(extractedData);
          return pDetails;
        }
        else {
          print(response.statusCode);
      }
    }
    catch (e) {
      print(e);
      return null;
    }
  }

}