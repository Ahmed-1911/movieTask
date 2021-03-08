import 'package:get/get.dart';
import 'package:movie_task/models/image.dart';
import 'package:movie_task/models/person-details.dart';
import 'package:movie_task/services/image-service.dart';
import 'package:movie_task/services/person-service.dart';

class PersonsDetailsController extends GetxController {
  PersonsDetailsController(this.personId);
  var personId;
  @override
  void onInit() {
    super.onInit();
    fetchPersonData(personId);
  }
  var isLoading = true.obs;
  var personsDetails  = PersonDetails().obs;
  var imagesList = List<Img>().obs;

  fetchPersonData(personId) async {
    isLoading(true);
    personsDetails.value = await PersonApi().fetchPersonDetails(personId);
    await fetchPersonListImages(personId);
    isLoading(false);
  }

  fetchPersonListImages(int personId)async{
    imagesList.value =await ImageApi().fetchPersonImages(personId);
  }
}