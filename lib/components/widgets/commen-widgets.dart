import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_task/components/constrains/constrain.dart';
import 'package:movie_task/views/details/person-details.dart';
import 'package:progressive_image/progressive_image.dart';

SpinKitWave spinKit(BuildContext context) {
  return SpinKitWave(
    color: primColor,
    size: 50.0,
  );
}


AutoSizeText autoText(String text, int maxLine, double fontSize,FontWeight fontWeight, Color color ) {
  return AutoSizeText(text,
      maxLines: maxLine,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style:GoogleFonts.elMessiri(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      )
  );
}

//******************************************************

myImageContainer(BuildContext context,String image){
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: ProgressiveImage(
      placeholder: AssetImage('assets/loading.gif'),
      thumbnail: NetworkImage(
          'https://image.tmdb.org/t/p/w500/$image'),
      image: NetworkImage(
          'https://image.tmdb.org/t/p/w500/$image'),
      fadeDuration: Duration(seconds: 2),
      excludeFromSemantics: true,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    ),
  );
}

//******************************************************************************
personImageContainer(BuildContext context,var index,var person){
  return AnimationConfiguration.staggeredGrid(
    position: index,
    duration: const Duration(milliseconds: 1500),
    columnCount: 2,
    child: ScaleAnimation(
      child: FadeInAnimation(
          child: GestureDetector(
            onTap: () {
              Get.to(Profile(person.id));
            },
            child: Hero(
              tag: '${person.id}',
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
                  child:myImageContainer(context,person.backdropPath)
              ),
            ),
          )),
    ),
  );
}