import 'package:get/get.dart';
import 'package:movie_task/models/person-model.dart';
import 'package:movie_task/services/person-service.dart';

class PersonsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchPersonListData();
  }

  var isLoading = true.obs;
  var personsList = List<Person>().obs;
  fetchPersonListData() async {
    isLoading(true);
    personsList.value = await PersonApi().fetchPersonsData();
    isLoading(false);
  }
}
