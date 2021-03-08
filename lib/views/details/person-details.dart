import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/components/widgets/commen-widgets.dart';
import 'package:movie_task/components/widgets/person-details-widgets.dart';
import 'package:movie_task/views/details/person-details-view-model.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile(this.personID);

  var personID;

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery
        .of(context)
        .size
        .width * 100;
    PersonsDetailsController person = Get.put(PersonsDetailsController(personID));
    return Scaffold(
        body: Obx(() =>
        // ignore: unrelated_type_equality_checks
        person.isLoading == true?
          Center(child: spinKit(context)) :
          Column(
            children: <Widget>[
              //==========================================================================================
              // build Top Section of Profile (include : Profile Image)
              //==========================================================================================
              buildHeader(person.personsDetails.value),
              //==========================================================================================
              // build middle Section of Profile (include : main info  )
              //==========================================================================================
              buildMainInfo(context, widthC, person.personsDetails.value),
              SizedBox(height: 10.0),
              //==========================================================================================
              //  build Bottom Section of Profile (include : email - phone number - about - location )
              //==========================================================================================
              buildInfo(context, person.personsDetails.value),
              //==========================================================================================
              //  build Bottom Section of page (include :all images  )
              //==========================================================================================
              buildImages(context, person.imagesList.value)
            ],
          )
        )
    );
  }
}

