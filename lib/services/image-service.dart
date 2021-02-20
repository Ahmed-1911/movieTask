import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_task/models/image.dart';

class ImageApi{
  String apiKey='5748c9cc927b2d946e4d0c007bb63972';
  Future<List<Img>> fetchPersonImages(int personId) async {
    try {
        var url = 'https://api.themoviedb.org/3/person/$personId/images?api_key=$apiKey';
        final response = await http.get(url);
        final extractedData = json.decode(response.body);
        if (response.statusCode == 200) {
          ImageList iList = ImageList.fromJson(extractedData);
          List personList=iList.images.map((e) => Img.fromJson(e)).toList();
          return personList;
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