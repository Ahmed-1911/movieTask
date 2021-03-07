import 'package:flutter/material.dart';
import 'package:movie_task/components/widgets/commen-widgets.dart';
import 'package:movie_task/services/save-image.dart';
import 'package:progressive_image/progressive_image.dart';
// ignore: must_be_immutable
class Show extends StatefulWidget {
  Show(this.image);
  var image;

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  bool done=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child:ProgressiveImage(
                placeholder:AssetImage('assets/loading.gif'),
                thumbnail: NetworkImage('https://image.tmdb.org/t/p/original/${widget.image}'),
                image: NetworkImage('https://image.tmdb.org/t/p/original/${widget.image}'),
                fadeDuration: Duration(seconds: 2),
                excludeFromSemantics: true,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              )
            ),
            //Download Button
            Positioned(
              bottom: 0,
              child: Container (
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: done==true?
                FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.done,color: Colors.green,),
                    label: autoText("Image Downloaded ", 1 , 20 ,FontWeight.w700,Colors.green,)
                ):
                FlatButton.icon(
                    onPressed: ()async{
                      bool downloaded = await saveImage(
                          "https://image.tmdb.org/t/p/original/${widget.image}",
                          "${widget.image}");
                      if (downloaded) {
                        setState(() {
                          done=true;
                        });
                      } else {
                        print("Problem Downloading File");
                      }
                    },
                    icon: Icon(Icons.file_download),
                    label: autoText("Download Image", 1 , 20 ,FontWeight.w700,Colors.black)
                )
              ),
            ),
          ],
      ),
    )
    );
  }
}
