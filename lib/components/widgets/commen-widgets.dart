import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_task/components/constrains/constrain.dart';
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