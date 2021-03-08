import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:movie_task/components/widgets/commen-widgets.dart';
import 'package:movie_task/views/home/persons-view-model.dart';
import 'file:///C:/Users/Ahmed-Uwk/Documents/GitHub/movieTask/lib/views/details/person-details.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonsController personsController=Get.put(PersonsController());
    return Scaffold(
        // ignore: unrelated_type_equality_checks
        body: Obx(()=> personsController.isLoading==true?
          Center(child:spinKit(context)):
          AnimationLimiter(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                personsController.personsList.length,
                    (int index) {
                  return personImageContainer(context,index,personsController.personsList[index]);
                },
              ),
            ),
          ))
    );
  }
}