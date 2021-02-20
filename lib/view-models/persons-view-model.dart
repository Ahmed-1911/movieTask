import 'package:flutter/cupertino.dart';
import 'package:movie_task/models/person-model.dart';
import 'package:movie_task/services/person-service.dart';

class PersonsProvider extends ChangeNotifier{
  List<Person> personsList = [];
  fetchPersonListData()async{
    personsList =await PersonApi().fetchPersonsData();
    notifyListeners();
  }
}