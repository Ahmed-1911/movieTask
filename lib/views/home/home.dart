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
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 1500),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(Profile(personsController.personsList[index].id));
                            },
                            child: Hero(
                              tag: '${personsController.personsList[index].id}',
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(4, 0),
                                          color: Colors.black26,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child:myImageContainer(context,personsController.personsList[index].backdropPath)
                              ),
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
          ))
    );
  }
}