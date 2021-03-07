import 'package:flutter/cupertino.dart';
import 'package:movie_task/models/image.dart';
import 'package:movie_task/services/image-service.dart';

class ImagesProvider extends ChangeNotifier{
  List<Img> imagesList = [];
  fetchPersonListImages(int personId)async{
   imagesList =await ImageApi().fetchPersonImages(personId);
    notifyListeners();
  }
}