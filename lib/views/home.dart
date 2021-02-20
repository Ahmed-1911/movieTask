import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_task/components/widgets/commen-widgets.dart';
import 'package:movie_task/view-models/persons-view-model.dart';
import 'package:movie_task/views/person-details.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PersonsProvider>(
          builder: (context,data,widget){
            var listItems=data.personsList;
            return FutureBuilder(
              future: data.fetchPersonListData(),
              builder: (context,snapshot){
                return listItems.length==0?
                 Center(child:spinKit(context)):
                 AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      listItems.length,
                          (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 1500),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile(listItems[index].id)
                                        )
                                    );
                                  },
                                  child: Hero(
                                    tag: '${listItems[index].id}',
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
                                      child:myImageContainer(context,listItems[index].backdrop_path)
                                    ),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        )
    );
  }
}