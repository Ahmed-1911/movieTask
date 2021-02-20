import 'package:flutter/cupertino.dart';
import 'package:movie_task/models/person-details.dart';
import 'package:movie_task/services/person-service.dart';

class PersonsDetailsProvider extends ChangeNotifier{
  PersonDetails personsDetails ;

  fetchPersonListData(personId)async{
    personsDetails =await PersonApi().fetchPersonDetails(personId);
    notifyListeners();
  }
}